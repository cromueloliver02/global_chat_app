import 'package:core_utils/src/exceptions/network_exception.dart';
import 'package:core_utils/src/exceptions/server_exception.dart';
import 'package:core_utils/src/exceptions/unexpected_exception.dart';
import 'package:equatable/equatable.dart';

part 'network_failure.dart';
part 'server_failure.dart';
part 'unexpected_failure.dart';

sealed class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}
