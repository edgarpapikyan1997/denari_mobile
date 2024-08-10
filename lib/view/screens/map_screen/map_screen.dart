import 'package:denari_app/constants/app_bar_type.dart';
import 'package:denari_app/constants/app_sizes/app_sizes.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: FlutterMap(
        options: MapOptions(
          // initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
          initialZoom: 9.2,
        ),
        children: [
          TileLayer( // Display map tiles from any source
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.example.app',
            maxNativeZoom: 19, // Scale tiles when the server doesn't support higher zoom levels
          ),
          RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                // onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
              ),
              // Also add images...
            ],
          ),
        ],
      ),
    );
  }
}
