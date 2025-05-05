import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sda_explorers_app/utils/constants.dart';

Color generateAvatarColor() {
  final Random random = Random();

  final double hue = random.nextDouble() * 360;
  final double saturation = 0.4 + random.nextDouble() * 0.2;
  final double lightness = 0.6 + random.nextDouble() * 0.15;

  return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0')}';
}

Color colorFromHex(String? hex) {
  if (hex == null || hex.isEmpty) {
    return Colors.blue;
  }
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) hex = 'FF$hex';
  return Color(int.parse(hex, radix: 16));
}

String getRandomAvatarName() {
  final Random random = Random();
  return AVATAR_NAMES[random.nextInt(AVATAR_NAMES.length)];
}