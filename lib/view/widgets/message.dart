import 'package:flutter/material.dart';

final class Message {
  static BuildContext? context;

  static show(String message) {
    if (context == null || context?.mounted == false) return;
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}