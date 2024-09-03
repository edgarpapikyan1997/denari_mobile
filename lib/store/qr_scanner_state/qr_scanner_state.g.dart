// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_scanner_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QRScannerState on ImplQRScannerState, Store {
  late final _$isScanningAtom =
      Atom(name: 'ImplQRScannerState.isScanning', context: context);

  @override
  bool get isScanning {
    _$isScanningAtom.reportRead();
    return super.isScanning;
  }

  @override
  set isScanning(bool value) {
    _$isScanningAtom.reportWrite(value, super.isScanning, () {
      super.isScanning = value;
    });
  }

  late final _$imageSizeAtom =
      Atom(name: 'ImplQRScannerState.imageSize', context: context);

  @override
  double get imageSize {
    _$imageSizeAtom.reportRead();
    return super.imageSize;
  }

  @override
  set imageSize(double value) {
    _$imageSizeAtom.reportWrite(value, super.imageSize, () {
      super.imageSize = value;
    });
  }

  late final _$animateQRScannerAsyncAction =
      AsyncAction('ImplQRScannerState.animateQRScanner', context: context);

  @override
  Future<void> animateQRScanner() {
    return _$animateQRScannerAsyncAction.run(() => super.animateQRScanner());
  }

  @override
  String toString() {
    return '''
isScanning: ${isScanning},
imageSize: ${imageSize}
    ''';
  }
}
