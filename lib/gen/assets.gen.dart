/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsMediaGen {
  const $AssetsMediaGen();

  /// Directory path: assets/media/icons
  $AssetsMediaIconsGen get icons => const $AssetsMediaIconsGen();

  /// Directory path: assets/media/images
  $AssetsMediaImagesGen get images => const $AssetsMediaImagesGen();
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class $AssetsMediaIconsGen {
  const $AssetsMediaIconsGen();

  /// File path: assets/media/icons/Activities.svg
  SvgGenImage get activities =>
      const SvgGenImage('assets/media/icons/Activities.svg');

  /// File path: assets/media/icons/Beauty.svg
  SvgGenImage get beauty => const SvgGenImage('assets/media/icons/Beauty.svg');

  /// File path: assets/media/icons/Clothing.svg
  SvgGenImage get clothing =>
      const SvgGenImage('assets/media/icons/Clothing.svg');

  /// File path: assets/media/icons/Groceries.svg
  SvgGenImage get groceries =>
      const SvgGenImage('assets/media/icons/Groceries.svg');

  /// File path: assets/media/icons/Other.svg
  SvgGenImage get other => const SvgGenImage('assets/media/icons/Other.svg');

  /// File path: assets/media/icons/Token.svg
  SvgGenImage get token => const SvgGenImage('assets/media/icons/Token.svg');

  /// File path: assets/media/icons/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/media/icons/bell.svg');

  /// File path: assets/media/icons/card.svg
  SvgGenImage get card => const SvgGenImage('assets/media/icons/card.svg');

  /// File path: assets/media/icons/chevron-left.svg
  SvgGenImage get chevronLeft =>
      const SvgGenImage('assets/media/icons/chevron-left.svg');

  /// File path: assets/media/icons/circle-user-round.svg
  SvgGenImage get circleUserRound =>
      const SvgGenImage('assets/media/icons/circle-user-round.svg');

  /// File path: assets/media/icons/credit-card-1.svg
  SvgGenImage get creditCard1 =>
      const SvgGenImage('assets/media/icons/credit-card-1.svg');

  /// File path: assets/media/icons/credit-card-sync.svg
  SvgGenImage get creditCardSync =>
      const SvgGenImage('assets/media/icons/credit-card-sync.svg');

  /// File path: assets/media/icons/drawer-send.svg
  SvgGenImage get drawerSend =>
      const SvgGenImage('assets/media/icons/drawer-send.svg');

  /// File path: assets/media/icons/food.svg
  SvgGenImage get food => const SvgGenImage('assets/media/icons/food.svg');

  /// File path: assets/media/icons/house.svg
  SvgGenImage get house => const SvgGenImage('assets/media/icons/house.svg');

  /// File path: assets/media/icons/image-8.svg
  SvgGenImage get image8 => const SvgGenImage('assets/media/icons/image-8.svg');

  /// File path: assets/media/icons/qr-code.svg
  SvgGenImage get qrCode => const SvgGenImage('assets/media/icons/qr-code.svg');

  /// File path: assets/media/icons/scan-line.svg
  SvgGenImage get scanLine =>
      const SvgGenImage('assets/media/icons/scan-line.svg');

  /// File path: assets/media/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/media/icons/search.svg');

  /// File path: assets/media/icons/store.svg
  SvgGenImage get store => const SvgGenImage('assets/media/icons/store.svg');

  /// File path: assets/media/icons/tokenWhite.svg
  SvgGenImage get tokenWhite =>
      const SvgGenImage('assets/media/icons/tokenWhite.svg');

  /// File path: assets/media/icons/travel.svg
  SvgGenImage get travel => const SvgGenImage('assets/media/icons/travel.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        activities,
        beauty,
        clothing,
        groceries,
        other,
        token,
        bell,
        card,
        chevronLeft,
        circleUserRound,
        creditCard1,
        creditCardSync,
        drawerSend,
        food,
        house,
        image8,
        qrCode,
        scanLine,
        search,
        store,
        tokenWhite,
        travel
      ];
}

class $AssetsMediaImagesGen {
  const $AssetsMediaImagesGen();

  /// File path: assets/media/images/Coffe.png
  AssetGenImage get coffe =>
      const AssetGenImage('assets/media/images/Coffe.png');

  /// File path: assets/media/images/crypto-currency-namecoin.png
  AssetGenImage get cryptoCurrencyNamecoin =>
      const AssetGenImage('assets/media/images/crypto-currency-namecoin.png');

  /// File path: assets/media/images/toy_story.png
  AssetGenImage get toyStory =>
      const AssetGenImage('assets/media/images/toy_story.png');

  /// List of all assets
  List<AssetGenImage> get values => [coffe, cryptoCurrencyNamecoin, toyStory];
}

class Assets {
  Assets._();

  static const $AssetsMediaGen media = $AssetsMediaGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
