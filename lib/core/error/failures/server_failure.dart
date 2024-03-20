part of 'failure.dart';

final class ServerFailure extends Failure {
  final ServerException exception;

  static const String title = 'Server Failure';

  const ServerFailure(this.exception);

  @override
  String toString() => 'Failure: ServerFailure\nException: $exception';
}
