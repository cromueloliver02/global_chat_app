// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bubble_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatBubbleImpl _$$ChatBubbleImplFromJson(Map<String, dynamic> json) =>
    _$ChatBubbleImpl(
      id: json['id'] as String,
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      sent: json['sent'] as bool? ?? true,
    );

Map<String, dynamic> _$$ChatBubbleImplToJson(_$ChatBubbleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sender': instance.sender,
      'sent': instance.sent,
    };
