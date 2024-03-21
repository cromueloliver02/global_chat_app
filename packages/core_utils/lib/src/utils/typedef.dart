import 'package:core_utils/src/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef StreamEither<T> = Stream<Either<Failure, T>>;

typedef JsonMap = Map<String, dynamic>;
