import 'package:chat_service/chat_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ChatRepository {
  StreamEither<List<ChatBubble>> loadMessages(String chatRoomId);

  FutureEither<void> sendMessage(Message message);
}

class ProfileRepositoryImpl implements ChatRepository {
  final ChatService _chatService;

  const ProfileRepositoryImpl({
    required ChatService chatService,
  }) : _chatService = chatService;

  @override
  StreamEither<List<ChatBubble>> loadMessages(String chatRoomId) async* {
    try {
      final Stream<List<ChatBubble>> chatBubblesStream =
          _chatService.loadMessages(chatRoomId);

      await for (final List<ChatBubble> chatBubbles in chatBubblesStream) {
        yield Right(chatBubbles);
      }
    } on ServerException catch (exception) {
      yield Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      yield Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      yield Left(UnexpectedFailure(exception));
    }
  }

  @override
  FutureEither<void> sendMessage(Message message) async {
    try {
      await _chatService.sendMessage(message);
      return const Right(null);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }
}
