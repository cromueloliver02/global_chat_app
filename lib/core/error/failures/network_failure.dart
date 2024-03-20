part of 'failure.dart';

final class NetworkFailure extends Failure {
  final NetworkException exception;

  static const String title = 'Network Failure';

  const NetworkFailure(this.exception);

  @override
  String toString() => 'Failure: NetworkFailure\nException: $exception';
}
