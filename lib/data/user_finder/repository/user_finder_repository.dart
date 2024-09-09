import 'package:denari_app/data/user_finder/model/user_finder_model.dart';


abstract class UserFinderRepository {
  Future<String?> findUser(String contactInfo);
}
