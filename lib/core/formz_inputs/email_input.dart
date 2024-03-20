import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String?, EmailInputError> {
  const EmailInput.pure([super.value = '']) : super.pure();

  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailInputError? validator(String? value) {
    final String? input = value?.trim();

    if (input == null || input.isEmpty) return EmailInputError.empty;

    if (!isEmail(input)) return EmailInputError.invalid;

    return null;
  }
}

extension EmailInputErrorX on EmailInputError {
  String text() {
    switch (this) {
      case EmailInputError.empty:
        return 'Email input field is required';
      case EmailInputError.invalid:
        return 'Invalid email';
    }
  }
}
