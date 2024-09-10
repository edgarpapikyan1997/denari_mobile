import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/themes/app_colors.dart';

class CustomButton extends StatefulWidget {
  final bool isEnabled;
  final bool isWhite;
  final String title;
  final Function  onTap;

  const CustomButton({
    super.key,
    required this.isEnabled,
    required this.isWhite,
    required this.title,
    required this.onTap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double shrinkScale = 0.9;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.isEnabled != true) {
          return;
        }else {
          _controller.forward();
          Future.delayed(const Duration(milliseconds: 200), () {
            _controller.reverse();
          });
          widget.onTap();
        }
      },
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: shrinkScale,
        ).animate(_controller),
        child: Container(
          height: 52,
          width: context.width,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? widget.isWhite
                      ? AppColors.white
                      : AppColors.black
                  : AppColors.greyLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: widget.isEnabled ? 1 : 0,
                  color: widget.isEnabled ? AppColors.black : AppColors.white)),
          // width: context.width,
          child: Center(
            child: Text(
              widget.title,
              style: widget.isEnabled
                  ? widget.isWhite
                      ? context.theme.headline4
                      : context.theme.headline4.white
                  : context.theme.headline4.lightGreyText,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
