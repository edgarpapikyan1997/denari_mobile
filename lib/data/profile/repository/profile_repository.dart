import 'package:denari_app/data/profile/model/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();

  Future<bool> updateProfile(Profile profile);
}
