import 'package:flutter/material.dart';

const defaultSize = 12.0;

class Delimiter extends SizedBox {
  const Delimiter([double size = defaultSize, Key? key])
      : super(
          key: key,
          height: size,
          width: size,
        );
}
