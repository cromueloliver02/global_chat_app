// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatListState {
  List<ChatBubble> get chatBubbles => throw _privateConstructorUsedError;
  LoadChatListStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatListStateCopyWith<ChatListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListStateCopyWith<$Res> {
  factory $ChatListStateCopyWith(
          ChatListState value, $Res Function(ChatListState) then) =
      _$ChatListStateCopyWithImpl<$Res, ChatListState>;
  @useResult
  $Res call(
      {List<ChatBubble> chatBubbles,
      LoadChatListStatus status,
      Failure? failure});
}

/// @nodoc
class _$ChatListStateCopyWithImpl<$Res, $Val extends ChatListState>
    implements $ChatListStateCopyWith<$Res> {
  _$ChatListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatBubbles = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      chatBubbles: null == chatBubbles
          ? _value.chatBubbles
          : chatBubbles // ignore: cast_nullable_to_non_nullable
              as List<ChatBubble>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadChatListStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatListStateImplCopyWith<$Res>
    implements $ChatListStateCopyWith<$Res> {
  factory _$$ChatListStateImplCopyWith(
          _$ChatListStateImpl value, $Res Function(_$ChatListStateImpl) then) =
      __$$ChatListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatBubble> chatBubbles,
      LoadChatListStatus status,
      Failure? failure});
}

/// @nodoc
class __$$ChatListStateImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListStateImpl>
    implements _$$ChatListStateImplCopyWith<$Res> {
  __$$ChatListStateImplCopyWithImpl(
      _$ChatListStateImpl _value, $Res Function(_$ChatListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatBubbles = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_$ChatListStateImpl(
      chatBubbles: null == chatBubbles
          ? _value._chatBubbles
          : chatBubbles // ignore: cast_nullable_to_non_nullable
              as List<ChatBubble>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoadChatListStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ChatListStateImpl extends _ChatListState with DiagnosticableTreeMixin {
  const _$ChatListStateImpl(
      {final List<ChatBubble> chatBubbles = const <ChatBubble>[],
      this.status = LoadChatListStatus.initial,
      this.failure = null})
      : _chatBubbles = chatBubbles,
        super._();

  final List<ChatBubble> _chatBubbles;
  @override
  @JsonKey()
  List<ChatBubble> get chatBubbles {
    if (_chatBubbles is EqualUnmodifiableListView) return _chatBubbles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatBubbles);
  }

  @override
  @JsonKey()
  final LoadChatListStatus status;
  @override
  @JsonKey()
  final Failure? failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatListState(chatBubbles: $chatBubbles, status: $status, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatListState'))
      ..add(DiagnosticsProperty('chatBubbles', chatBubbles))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chatBubbles, _chatBubbles) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_chatBubbles), status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      __$$ChatListStateImplCopyWithImpl<_$ChatListStateImpl>(this, _$identity);
}

abstract class _ChatListState extends ChatListState {
  const factory _ChatListState(
      {final List<ChatBubble> chatBubbles,
      final LoadChatListStatus status,
      final Failure? failure}) = _$ChatListStateImpl;
  const _ChatListState._() : super._();

  @override
  List<ChatBubble> get chatBubbles;
  @override
  LoadChatListStatus get status;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
