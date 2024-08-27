import 'package:denari_app/data/shops/shop_unit_model/shop_unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/shops/shops_repository/impl/shops_repository.dart';
import '../../../store/shops/shops_state/shops_state.dart';
import '../../../utils/di/config.dart';
import '../../../utils/padding_utility/padding_utility.dart';
import '../../../utils/themes/app_colors.dart';

class ImageAppBar extends StatefulWidget {
  final Widget? leadingIcon;
  final List<String>? imageList;

  const ImageAppBar({super.key, this.imageList = const [], this.leadingIcon});

  @override
  State<ImageAppBar> createState() => _ImageAppBarState();
}

class _ImageAppBarState extends State<ImageAppBar> {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          widget.imageList?.isEmpty == true
              ? const SizedBox(
                )
              : PageView.builder(
                  controller: pageController,
                  itemCount: widget.imageList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.imageList![index],
                          ),
                        ),
                      ),
                    );
                  }),
          widget.leadingIcon != null
              ? Positioned(
                  child: PaddingUtility.only(
                      top: 60,
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: SizedBox(
                          height: 28, width: 26, child: widget.leadingIcon)),
                )
              : const SizedBox(
                  width: 24,
                  height: 24,
                ),
          Positioned(
            child: PaddingUtility.only(
              bottom: 8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: widget.imageList!.length,
                  effect: WormEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: AppColors.white,
                    dotColor: AppColors.white.withOpacity(0.4),
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
