import 'package:formz/formz.dart';

enum UsernameInputError { empty, invalid }

class UsernameInput extends FormzInput<String?, UsernameInputError> {
  const UsernameInput.pure([super.value = '']) : super.pure();

  const UsernameInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _usernameRegExp =
      RegExp(r'^[a-zA-Z0-9][a-zA-Z0-9_.]*[a-zA-Z0-9]$');

  @override
  UsernameInputError? validator(String? value) {
    final String? input = value?.trim();

    if (input == null || input.isEmpty) return UsernameInputError.empty;

    if (!_usernameRegExp.hasMatch(input)) return UsernameInputError.invalid;

    return null;
  }
}

extension UsernameInputErrorX on UsernameInputError {
  String text() {
    switch (this) {
      case UsernameInputError.empty:
        return 'Username input field is required';
      case UsernameInputError.invalid:
        return 'Invalid username';
    }
  }
}
