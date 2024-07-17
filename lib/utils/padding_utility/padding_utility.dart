import 'package:flutter/material.dart';

const defaultSize = 16.0;

class PaddingUtility extends Padding {
  PaddingUtility({
    super.key,
    double all = defaultSize,
    super.child,
  }) : super(
          padding: EdgeInsets.all(all),
        );

  PaddingUtility.symmetric({
    super.key,
    double horizontal = defaultSize,
    double vertical = defaultSize,
    required Widget super.child,
  }) : super(
            padding: EdgeInsets.symmetric(
                horizontal: horizontal, vertical: vertical));

  PaddingUtility.only({
    super.key,
    double top = defaultSize,
    double bottom = defaultSize,
    double left = defaultSize,
    double right = defaultSize,
    required Widget super.child,
  }) : super(
            padding: EdgeInsets.only(
                top: top, bottom: bottom, left: left, right: right));
}
