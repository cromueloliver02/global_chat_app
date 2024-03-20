class ServerException implements Exception {
  final String statusCode;
  final String message;
  final Object error;
  final StackTrace stackTrace;

  static const String defaultMessage = 'Server error occurred';

  const ServerException(
    this.statusCode,
    this.error, {
    required this.stackTrace,
    this.message = defaultMessage,
  });

  @override
  String toString() => 'ServerException\n'
      'Status code: $statusCode\n'
      'Message: $message\n'
      'Error: $error\n\n'
      'StackTrace: $stackTrace';
}
