import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/store/loading_state/loading_state.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/padding_utility/padding_utility.dart';
import 'package:denari_app/view/widgets/bottom_sheet/bottom_sheet_upper_piece.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../constants/shop_tems.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/themes/app_colors.dart';
import '../../widgets/bottom_sheet/variants/modal_sheet.dart';
import '../store_field_screen/widgets/store_field_generator.dart';
import '../store_field_screen/widgets/store_item_info.dart';
import '../store_field_screen/widgets/store_item_info_creater.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
    curve: Curves.easeInOut,
  );

  final LoadingState loadingState = LoadingState();
  String name = 'Store Name';
  String rating = "4.5";
  String phone = '+1 (123) 456-7890';
  String city = '123 Main St, City';
  String dateTime = 'Daily from 10:00 to 20:00';
  double defaultHeight = 49;
  double defaultWidth = 44;
  double selectedHeight = 69;
  double selectedWidth = 60;
  ColorFilter iconColor =
      const ColorFilter.mode(AppColors.yellowDark, BlendMode.srcIn);

  LatLng? selectedMarker;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    loadingState.startLoading();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _animatedMapController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      loadingState.stopLoading();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        loadingState.stopLoading();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      loadingState.stopLoading();
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _animatedMapController.mapController.move(_currentLocation!, 13.4);
      loadingState.stopLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: AppSizes.prefSizes,
          child: CustomAppBar(
            appBarType: AppBarType.regular,
            leadingIcon: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Assets.media.icons.chevronLeft.svg(),
            ),
            title: Text(
              'shops.branches'.tr(),
              style: context.theme.headline4,
            ),
            tealIcon: GestureDetector(
              onTap: () {},
              child: Assets.media.icons.filter.svg(),
            ),
          ),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: _animatedMapController.mapController,
              options: MapOptions(
                initialCenter: _currentLocation ?? const LatLng(50.5, 30.51),
                maxZoom: 17.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.denari.flutter_map_denari.example',
                ),
                if (_currentLocation != null)
                  MarkerLayer(
                    markers: [
                      buildMarker(const LatLng(40.1910, 44.5190)),
                      buildMarker(const LatLng(40.1850, 44.5110)),
                      buildMarker(const LatLng(40.1710, 44.5160)),
                    ],
                  ),
              ],
            ),
            loadingState.isLoading
                ? const Positioned(
                    child: Center(child: CircularProgressIndicator()))
                : const SizedBox(),
          ],
        ),
      );
    });
  }

  Marker buildMarker(LatLng point) {
    bool isSelected = selectedMarker == point;
    return Marker(
      point: point,
      height: isSelected ? selectedHeight : defaultHeight,
      width: isSelected ? selectedWidth : defaultWidth,
      child: GestureDetector(
          onTap: () {
            _animatedMapController.animateTo(
              dest: point,
              zoom: 14,
              curve: Curves.ease,
              offset: const Offset(0, -100),
            );
            setState(() {
              selectedMarker = point;
            });
            showModalSheet(
              context: context,
              child: PaddingUtility(
                all: 16,
                child:  SizedBox(
                  width: context.width,
                  height: context.height / 2,
                  child: Column(
                    children: [
                      const Delimiter(8),
                      const BottomSheetUpperPiece(),
                      StoreItemInfo(
                        items: [
                          StoreItemInfoCreator(
                            svgPicture: Assets.media.icons.phoneCall
                                .svg(colorFilter: iconColor),
                            textValue: phone,
                          ),
                          StoreItemInfoCreator(
                            svgPicture: Assets.media.icons.map
                                .svg(colorFilter: iconColor),
                            textValue: city,
                          ),
                          StoreItemInfoCreator(
                            svgPicture: Assets.media.icons.clock
                                .svg(colorFilter: iconColor),
                            textValue: dateTime,
                          ),
                        ],
                      ),
                     const Delimiter(16),
                      StoreFieldGenerator(
                        isGrid: false,
                        storeFieldList: allShops,
                        width: 160,
                        height: 156,
                        excludeTitle: true,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: isSelected
              ? Assets.media.icons.bigPin.svg()
              : Assets.media.icons.pin.svg()),
    );
  }
}
