import 'package:denari_app/store/qr_scanner_state/qr_scanner_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../store/shops/shops_state/shops_state.dart';
import '../../../../utils/di/config.dart';
import '../../store_field_screen/widgets/store_field_arguments.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScannerScreen> {
  final ShopsState _shopsState = ShopsState(
    shopsRepository: di.get<ImplShopsRepository>(),
  );
  MobileScannerController mobileScannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    returnImage: true,
  );

  final QRScannerState qrScannerState = QRScannerState();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  Future<void> initPrefs() async {
    await _shopsState.getAllShops();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              MobileScanner(
                controller: mobileScannerController,
                onDetect: (capture) async {
                  // Only proceed if scanning is enabled
                  if (!qrScannerState.isScanningEnabled) return;

                  qrScannerState.disableScanner(); // Disable scanner after a successful scan
                  qrScannerState.animateQRScanner();

                  if (_shopsState.shops.isNotEmpty &&
                      _shopsState.shops[0].id.isNotEmpty) {
                    context.push(
                      '/storeFieldItemScreen',
                      extra: StoreFieldItemArguments(
                        uniqueID: _shopsState.shops[0].id,
                        isQRScanned: true,
                      ),
                    );
                  } else {
                    print('No shops found or ID is empty');
                  }
                },
                overlayBuilder: (context, constraints) {
                  return _buildQrScannerOverlay(context, constraints);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildQrScannerOverlay(
      BuildContext context, BoxConstraints constraints) {
    return Observer(
      builder: (_) {
        return Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.5),
              height: context.height,
              width: context.width,
              child: Center(
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300),
                  width: qrScannerState.imageSize,
                  height: qrScannerState.imageSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.media.images.frame.path),
                    ),
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
