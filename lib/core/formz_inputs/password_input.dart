import 'package:formz/formz.dart';

enum PasswordInputError { empty, invalid }

class PasswordInput extends FormzInput<String?, PasswordInputError> {
  const PasswordInput.pure([super.value = '']) : super.pure();

  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputError? validator(String? value) {
    final String? input = value?.trim();

    if (input == null || input.isEmpty) return PasswordInputError.empty;

    if (input.length < 6) return PasswordInputError.invalid;

    return null;
  }
}

extension PasswordInputErrorX on PasswordInputError {
  String text() {
    switch (this) {
      case PasswordInputError.empty:
        return 'Password is required';
      case PasswordInputError.invalid:
        return 'Password must be at least 6 characters long';
    }
  }
}
