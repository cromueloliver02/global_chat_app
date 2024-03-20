import 'package:fpdart/fpdart.dart';

import 'package:global_chat/core/error/failures/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef StreamEither<T> = Stream<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
