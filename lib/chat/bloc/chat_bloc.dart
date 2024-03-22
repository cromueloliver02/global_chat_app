import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:chat_service/chat_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;

  ChatBloc({
    required ChatRepository chatRepository,
  })  : _chatRepository = chatRepository,
        super(ChatState.initial()) {
    on<ChatMessageSent>(_onChatMessageSent);
  }

  Future<void> _onChatMessageSent(
    ChatMessageSent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatState.inProgress());

    final Message message = Message(
      id: 'id',
      text: event.text,
      chatRoomId: event.chatRoomId,
      senderId: event.senderId,
      timestamp: DateTime.timestamp(),
    );

    final Either<Failure, void> either =
        await _chatRepository.sendMessage(message);

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(ChatState.failure(failure));
      },
      (_) => emit(ChatState.success()),
    );
  }
}
