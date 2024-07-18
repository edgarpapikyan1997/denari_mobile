import 'package:get_it/get_it.dart';
import 'package:denari_app/model/qr_id.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void configure()  {
     getIt.registerSingleton<QRIdReceiver>(QRIdReceiver());
  }
}
