import 'package:chat_room_service/chat_room_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:core_utils/core_utils.dart';

class ChatRoomFirebaseService implements ChatRoomService {
  final firestore.FirebaseFirestore _firebaseFirestore;

  const ChatRoomFirebaseService({
    required firestore.FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<List<ChatRoom>> loadChatRooms() async {
    try {
      final firestore.QuerySnapshot<JsonMap> chatRoomQuerySnap =
          await _firebaseFirestore.collection(kChatRoomsCollection).get();

      final List<ChatRoom> chatRooms = chatRoomQuerySnap.docs
          .map((d) => ChatRoom.fromJson(d.data()))
          .toList();

      return chatRooms;
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
}
