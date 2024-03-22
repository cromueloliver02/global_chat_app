import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:chat_service/chat_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_list_bloc.freezed.dart';
part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository _chatRepository;

  ChatListBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(ChatListState.initial()) {
    on<ChatListLoaded>(_onChatListLoaded);
  }

  Future<void> _onChatListLoaded(
    ChatListLoaded event,
    Emitter<ChatListState> emit,
  ) async {
    emit(ChatListState.inProgress());

    final Stream<Either<Failure, List<ChatBubble>>> eitherStream =
        _chatRepository.loadMessages(event.chatRoomId);

    await emit.onEach<Either<Failure, List<ChatBubble>>>(
      eitherStream,
      onData: (Either<Failure, List<ChatBubble>> either) => either.fold(
        (Failure failure) {
          debugPrint(failure.toString());
          emit(ChatListState.failure(failure));
        },
        (List<ChatBubble> chatBubbles) {
          emit(ChatListState.success(chatBubbles));
        },
      ),
    );
  }
}
