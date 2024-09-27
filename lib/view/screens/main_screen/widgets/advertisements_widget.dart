import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:denari_app/data/advertisements/model/advertisement_model.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/main_screen/bloc/advertisements_bloc.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AdvertisementsWidget extends StatefulWidget {
  const AdvertisementsWidget({super.key});

  @override
  State<AdvertisementsWidget> createState() => _AdvertisementsWidgetState();
}

class _AdvertisementsWidgetState extends State<AdvertisementsWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvertisementsBloc, AdvertisementsState>(
      listener: _listenStates,
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 124,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              viewportFraction: 1.0,
            ),
            itemCount: state.items.length,
            itemBuilder: (context, index, indexView) {
              final item = state.items[index];
              return AdvertisementView(
                key: ValueKey('adv_${item.id}'),
                item: item,
              );
            },

          ),
        );
      },
    );
  }

  void _listenStates(BuildContext context, AdvertisementsState state) {
    if (state is AdvertisementsErrorState) {
      Message.show(state.error ?? 'main.error_adv'.tr());
    }
  }
}

class AdvertisementView extends StatelessWidget {
  final AdvertisementModel item;

  const AdvertisementView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.siteUrl.isNotEmpty
          ? () => launchUrlString(
                item.siteUrl,
                mode: LaunchMode.externalApplication,
              )
          : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: AppColors.greyDark.withOpacity(0.2),
                blurRadius: 3,
                blurStyle: BlurStyle.normal,
                spreadRadius: 2.5,
                offset: const Offset(0, 3)),
          ],
          color: AppColors.greyLight.withOpacity(0.2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: item.imageUrl,
            height: 124,
            width: context.width,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
