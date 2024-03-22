// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatRoomState {
  List<ChatRoom> get chatRooms => throw _privateConstructorUsedError;
  LoadChatRoomsStatus get loadStatus => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRoomStateCopyWith<ChatRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
          ChatRoomState value, $Res Function(ChatRoomState) then) =
      _$ChatRoomStateCopyWithImpl<$Res, ChatRoomState>;
  @useResult
  $Res call(
      {List<ChatRoom> chatRooms,
      LoadChatRoomsStatus loadStatus,
      Failure? failure});
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res, $Val extends ChatRoomState>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRooms = null,
    Object? loadStatus = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      chatRooms: null == chatRooms
          ? _value.chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<ChatRoom>,
      loadStatus: null == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadChatRoomsStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomStateImplCopyWith<$Res>
    implements $ChatRoomStateCopyWith<$Res> {
  factory _$$ChatRoomStateImplCopyWith(
          _$ChatRoomStateImpl value, $Res Function(_$ChatRoomStateImpl) then) =
      __$$ChatRoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatRoom> chatRooms,
      LoadChatRoomsStatus loadStatus,
      Failure? failure});
}

/// @nodoc
class __$$ChatRoomStateImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$ChatRoomStateImpl>
    implements _$$ChatRoomStateImplCopyWith<$Res> {
  __$$ChatRoomStateImplCopyWithImpl(
      _$ChatRoomStateImpl _value, $Res Function(_$ChatRoomStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRooms = null,
    Object? loadStatus = null,
    Object? failure = freezed,
  }) {
    return _then(_$ChatRoomStateImpl(
      chatRooms: null == chatRooms
          ? _value._chatRooms
          : chatRooms // ignore: cast_nullable_to_non_nullable
              as List<ChatRoom>,
      loadStatus: null == loadStatus
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadChatRoomsStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ChatRoomStateImpl extends _ChatRoomState with DiagnosticableTreeMixin {
  const _$ChatRoomStateImpl(
      {final List<ChatRoom> chatRooms = const <ChatRoom>[],
      this.loadStatus = LoadChatRoomsStatus.initial,
      this.failure = null})
      : _chatRooms = chatRooms,
        super._();

  final List<ChatRoom> _chatRooms;
  @override
  @JsonKey()
  List<ChatRoom> get chatRooms {
    if (_chatRooms is EqualUnmodifiableListView) return _chatRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatRooms);
  }

  @override
  @JsonKey()
  final LoadChatRoomsStatus loadStatus;
  @override
  @JsonKey()
  final Failure? failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomState(chatRooms: $chatRooms, loadStatus: $loadStatus, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomState'))
      ..add(DiagnosticsProperty('chatRooms', chatRooms))
      ..add(DiagnosticsProperty('loadStatus', loadStatus))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStateImpl &&
            const DeepCollectionEquality()
                .equals(other._chatRooms, _chatRooms) &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_chatRooms), loadStatus, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomStateImplCopyWith<_$ChatRoomStateImpl> get copyWith =>
      __$$ChatRoomStateImplCopyWithImpl<_$ChatRoomStateImpl>(this, _$identity);
}

abstract class _ChatRoomState extends ChatRoomState {
  const factory _ChatRoomState(
      {final List<ChatRoom> chatRooms,
      final LoadChatRoomsStatus loadStatus,
      final Failure? failure}) = _$ChatRoomStateImpl;
  const _ChatRoomState._() : super._();

  @override
  List<ChatRoom> get chatRooms;
  @override
  LoadChatRoomsStatus get loadStatus;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomStateImplCopyWith<_$ChatRoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
