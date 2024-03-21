part of 'failure.dart';

final class UnexpectedFailure extends Failure {
  final UnexpectedException exception;

  static const String title = 'Something Went Wrong';

  const UnexpectedFailure(this.exception);

  @override
  String toString() => 'Failure: UnexpectedFailure\nException: $exception';
}
