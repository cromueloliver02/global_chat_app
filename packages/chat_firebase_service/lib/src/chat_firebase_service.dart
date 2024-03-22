import 'dart:io';

import 'package:auth_service/auth_service.dart';
import 'package:chat_service/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';
import 'package:uuid/uuid.dart';

class ChatFirebaseService implements ChatService {
  final firestore.FirebaseFirestore _firebaseFirestore;

  const ChatFirebaseService({
    required firestore.FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Stream<List<ChatBubble>> loadMessages(String chatRoomId) async* {
    try {
      final Stream<firestore.QuerySnapshot<JsonMap>> messagesQuerySnapStream =
          _firebaseFirestore
              .collection(kChatRoomsCollection)
              .doc(chatRoomId)
              .collection(kMessagesCollection)
              .orderBy('timestamp', descending: true)
              .snapshots();

      await for (final messagesQuerySnap in messagesQuerySnapStream) {
        final List<Message> messages = messagesQuerySnap.docs
            .map((d) => Message.fromJson(d.data()))
            .toList();

        final List<ChatBubble> chatBubbles = [];

        for (final Message message in messages) {
          final firestore.DocumentSnapshot<JsonMap> userDocSnap =
              await _firebaseFirestore
                  .collection(kUsersCollection)
                  .doc(message.senderId)
                  .get();

          if (!userDocSnap.exists) {
            throw ServerException(
              HttpStatus.notFound.toString(),
              Exception('User not found'),
              message: 'User not found',
              stackTrace: StackTrace.current,
            );
          }

          final User sender = User.fromJson(userDocSnap.data()!);

          final ChatBubble chatBubble = ChatBubble(
            id: const Uuid().v4(),
            message: message,
            sender: sender,
          );

          chatBubbles.add(chatBubble);
        }

        yield chatBubbles;
      }
    } on ServerException {
      rethrow;
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> sendMessage(Message message) async {
    try {
      final firestore.DocumentReference<JsonMap> messageDocRef =
          _firebaseFirestore
              .collection(kChatRoomsCollection)
              .doc(message.chatRoomId)
              .collection(kMessagesCollection)
              .doc();

      final Message messageData = message.copyWith(id: messageDocRef.id);

      await messageDocRef.set(messageData.toJson());
    } on firestore.FirebaseException catch (error, stackTrace) {
      throw FirebaseErrorUtils.handleFirebaseException(
        error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      throw UnexpectedException(error, stackTrace: stackTrace);
    }
  }
}
