import 'package:core_utils/core_utils.dart';
import 'package:fpdart/fpdart.dart';
import 'package:profile_service/profile_service.dart';

abstract interface class ProfileRepository {
  FutureEither<void> getProfile(String uid);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService _profileService;

  const ProfileRepositoryImpl({
    required ProfileService profileService,
  }) : _profileService = profileService;

  @override
  FutureEither<void> getProfile(String uid) async {
    try {
      await _profileService.getProfile(uid);
      return const Right(null);
    } on ServerException catch (exception) {
      return Left(ServerFailure(exception));
    } on NetworkException catch (exception) {
      return Left(NetworkFailure(exception));
    } on UnexpectedException catch (exception) {
      return Left(UnexpectedFailure(exception));
    }
  }
}
