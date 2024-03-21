import 'package:profile_service/src/models/profile/profile_model.dart';

abstract interface class ProfileService {
  Future<Profile> getProfile(String uid);
}
