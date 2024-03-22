import 'package:chat_room_service/chat_room_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ChatRoomRepository {
  FutureEither<List<ChatRoom>> loadChatRooms();
}

class ChatRoomRepositoryImpl implements ChatRoomRepository {
  final ChatRoomService _chatRoomService;

  const ChatRoomRepositoryImpl({
    required ChatRoomService chatRoomService,
  }) : _chatRoomService = chatRoomService;

  @override
  FutureEither<List<ChatRoom>> loadChatRooms() async {
    try {
      final List<ChatRoom> chatRooms = await _chatRoomService.loadChatRooms();
      return Right(chatRooms);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }
}
