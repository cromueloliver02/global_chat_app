import 'package:equatable/equatable.dart';

import 'package:global_chat/core/error/exceptions/exceptions.dart';

part 'network_failure.dart';
part 'server_failure.dart';
part 'unexpected_failure.dart';

sealed class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}
