import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:chat_service/chat_service.dart';
import 'package:core_utils/core_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/formz_inputs/formz_inputs.dart';

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
    on<ChatMessageChanged>(_onChatMessageChanged);
  }

  Future<void> _onChatMessageSent(
    ChatMessageSent event,
    Emitter<ChatState> emit,
  ) async {
    final bool isValid = state.messageInput.isValid;

    if (!isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final Message message = Message(
      id: 'id',
      text: state.messageInput.value!,
      chatRoomId: event.chatRoomId,
      senderId: event.senderId,
      timestamp: DateTime.timestamp(),
    );

    final Either<Failure, void> either =
        await _chatRepository.sendMessage(message);

    either.fold(
      (Failure failure) {
        debugPrint(failure.toString());
        emit(
          state.copyWith(
            status: FormzSubmissionStatus.failure,
            failure: failure,
          ),
        );
      },
      (_) => emit(const ChatState(status: FormzSubmissionStatus.success)),
    );
  }

  void _onChatMessageChanged(
    ChatMessageChanged event,
    Emitter<ChatState> emit,
  ) {
    final MessageInput messageInput = MessageInput.dirty(event.message);

    emit(state.copyWith(messageInput: messageInput));
  }
}
