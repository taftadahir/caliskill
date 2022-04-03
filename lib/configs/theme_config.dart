import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:flutter/material.dart';

class ThemeConfig {
  // Application physics
  static ScrollPhysics? get kPhysics => const BouncingScrollPhysics();

  // Icon theme
  static IconThemeData iconTheme = IconThemeData(
    color: palette.primary.shade900,
    opacity: 1.0,
    size: 24 * LayoutConstant.kScaleFactor,
  );
}
