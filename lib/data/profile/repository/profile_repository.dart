import 'package:denari_app/data/profile/model/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile();

  Future<bool> updateProfile(ProfileModel profile);

  Future<bool> invite(String contact);
}
