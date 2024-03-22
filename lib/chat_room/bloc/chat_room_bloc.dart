import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_room_repository/chat_room_repository.dart';
import 'package:chat_room_service/chat_room_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_bloc.freezed.dart';
part 'chat_room_event.dart';
part 'chat_room_state.dart';

class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  final ChatRoomRepository _chatRoomRepository;

  ChatRoomBloc({
    required ChatRoomRepository chatRoomRepository,
  })  : _chatRoomRepository = chatRoomRepository,
        super(ChatRoomState.initial()) {
    on<ChatRoomsLoaded>(_onChatRoomsLoaded);
  }

  Future<void> _onChatRoomsLoaded(
    ChatRoomsLoaded event,
    Emitter<ChatRoomState> emit,
  ) async {
    emit(state.copyWith(loadStatus: LoadChatRoomsStatus.inProgress));

    final Either<Failure, List<ChatRoom>> either =
        await _chatRoomRepository.loadChatRooms();

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(ChatRoomState.failure(failure));
      },
      (List<ChatRoom> chatRooms) => emit(ChatRoomState.success(chatRooms)),
    );
  }
}
