import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:global_chat/core/utils/constants.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String uid,
    required String username,
    required String email,
    required String profileUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFBAuthUser(auth.User user) {
    return User(
      uid: user.uid,
      username: user.displayName ?? 'Anonymous',
      email: user.email ?? '',
      profileUrl: user.photoURL ?? kDefaultAvatarUrl,
    );
  }
}
