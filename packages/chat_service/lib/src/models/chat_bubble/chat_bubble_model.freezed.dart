// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bubble_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatBubble _$ChatBubbleFromJson(Map<String, dynamic> json) {
  return _ChatBubble.fromJson(json);
}

/// @nodoc
mixin _$ChatBubble {
  String get id => throw _privateConstructorUsedError;
  Message get message => throw _privateConstructorUsedError;
  User get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBubbleCopyWith<ChatBubble> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBubbleCopyWith<$Res> {
  factory $ChatBubbleCopyWith(
          ChatBubble value, $Res Function(ChatBubble) then) =
      _$ChatBubbleCopyWithImpl<$Res, ChatBubble>;
  @useResult
  $Res call({String id, Message message, User sender});

  $MessageCopyWith<$Res> get message;
  $UserCopyWith<$Res> get sender;
}

/// @nodoc
class _$ChatBubbleCopyWithImpl<$Res, $Val extends ChatBubble>
    implements $ChatBubbleCopyWith<$Res> {
  _$ChatBubbleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? sender = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get sender {
    return $UserCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatBubbleImplCopyWith<$Res>
    implements $ChatBubbleCopyWith<$Res> {
  factory _$$ChatBubbleImplCopyWith(
          _$ChatBubbleImpl value, $Res Function(_$ChatBubbleImpl) then) =
      __$$ChatBubbleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Message message, User sender});

  @override
  $MessageCopyWith<$Res> get message;
  @override
  $UserCopyWith<$Res> get sender;
}

/// @nodoc
class __$$ChatBubbleImplCopyWithImpl<$Res>
    extends _$ChatBubbleCopyWithImpl<$Res, _$ChatBubbleImpl>
    implements _$$ChatBubbleImplCopyWith<$Res> {
  __$$ChatBubbleImplCopyWithImpl(
      _$ChatBubbleImpl _value, $Res Function(_$ChatBubbleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? message = null,
    Object? sender = null,
  }) {
    return _then(_$ChatBubbleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatBubbleImpl extends _ChatBubble with DiagnosticableTreeMixin {
  _$ChatBubbleImpl(
      {required this.id, required this.message, required this.sender})
      : super._();

  factory _$ChatBubbleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatBubbleImplFromJson(json);

  @override
  final String id;
  @override
  final Message message;
  @override
  final User sender;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatBubble(id: $id, message: $message, sender: $sender)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatBubble'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('sender', sender));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatBubbleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, message, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatBubbleImplCopyWith<_$ChatBubbleImpl> get copyWith =>
      __$$ChatBubbleImplCopyWithImpl<_$ChatBubbleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatBubbleImplToJson(
      this,
    );
  }
}

abstract class _ChatBubble extends ChatBubble {
  factory _ChatBubble(
      {required final String id,
      required final Message message,
      required final User sender}) = _$ChatBubbleImpl;
  _ChatBubble._() : super._();

  factory _ChatBubble.fromJson(Map<String, dynamic> json) =
      _$ChatBubbleImpl.fromJson;

  @override
  String get id;
  @override
  Message get message;
  @override
  User get sender;
  @override
  @JsonKey(ignore: true)
  _$$ChatBubbleImplCopyWith<_$ChatBubbleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
