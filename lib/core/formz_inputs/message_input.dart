import 'package:formz/formz.dart';

enum MessageInputError { empty }

class MessageInput extends FormzInput<String?, MessageInputError> {
  const MessageInput.pure([super.value = '']) : super.pure();

  const MessageInput.dirty([super.value = '']) : super.dirty();

  @override
  MessageInputError? validator(String? value) {
    final String? input = value?.trim();

    if (input == null || input.isEmpty) return MessageInputError.empty;

    return null;
  }
}

extension MessageInputErrorX on MessageInputError {
  String text() {
    switch (this) {
      case MessageInputError.empty:
        return 'Message input field is required';
    }
  }
}
