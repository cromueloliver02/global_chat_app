import 'package:auth_service/auth_service.dart';
import 'package:chat_service/chat_service.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bubble_model.freezed.dart';
part 'chat_bubble_model.g.dart';

@freezed
class ChatBubble with _$ChatBubble {
  ChatBubble._();

  factory ChatBubble({
    required String id,
    required Message message,
    required User sender,
    @Default(true) bool sent,
  }) = _ChatBubble;

  factory ChatBubble.fromJson(Map<String, dynamic> json) =>
      _$ChatBubbleFromJson(json);
}
