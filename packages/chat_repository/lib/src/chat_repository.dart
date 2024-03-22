import 'package:chat_service/chat_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ChatRepository {
  StreamEither<List<Message>> loadMessages();

  FutureEither<void> sendMessage(Message message);
}

class ProfileRepositoryImpl implements ChatRepository {
  final ChatService _chatService;

  const ProfileRepositoryImpl({
    required ChatService chatService,
  }) : _chatService = chatService;

  @override
  StreamEither<List<Message>> loadMessages() async* {
    try {
      final Stream<List<Message>> messagesStream = _chatService.loadMessages();

      await for (final List<Message> messages in messagesStream) {
        yield Right(messages);
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
