import 'package:mobx/mobx.dart';

part 'qr_scanner_state.g.dart';


class QRScannerState = ImplQRScannerState with _$QRScannerState;

abstract class ImplQRScannerState with Store {
  @observable
  bool isScanning = false;

  @observable
  double imageSize = 250.0;

  @observable
  bool isScanningEnabled = true;

  @action
  Future<void> animateQRScanner() async {
    if (!isScanning) {
      isScanning = true;
      imageSize = 230.0;
      await Future.delayed(const Duration(milliseconds: 200));
      imageSize = 250.0;
      await Future.delayed(const Duration(milliseconds: 200));
      isScanning = false;
    }
  }

  @action
  void disableScanner() {
    isScanningEnabled = false;
  }

  @action
  void enableScanner() {
    isScanningEnabled = true;
  }

  @action
  void reset() {
    isScanning = false;
    imageSize = 250.0;
    isScanningEnabled = true;
  }
}
