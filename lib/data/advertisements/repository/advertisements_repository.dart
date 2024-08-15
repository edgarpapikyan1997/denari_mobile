import 'package:denari_app/data/advertisements/model/advertisement_model.dart';

abstract class AdvertisementsRepository {
  Future<List<AdvertisementModel>> getAdvertisements();
}
