class NetworkException implements Exception {
  final String message;
  final Object error;
  final StackTrace stackTrace;

  static const String defaultMessage = 'Network error occurred';

  const NetworkException(
    this.error, {
    required this.stackTrace,
    this.message = defaultMessage,
  });

  @override
  String toString() => 'NetworkException\n'
      'Message: $message\n'
      'Error: $error\n\n'
      'StackTrace: $stackTrace';
}
