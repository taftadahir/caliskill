import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/configs/style_config.dart';
import 'package:caliskill/configs/theme_config.dart';
import 'package:flutter/material.dart';

class Mode {
  static final ThemeData light = ThemeData(
    primarySwatch: palette.primary,
    scaffoldBackgroundColor: palette.primary.shade50,
    fontFamily: 'Montserrat',
    textTheme: StyleConfig.textTheme,
    textButtonTheme: StyleConfig.textButtonStyle,
    iconTheme: ThemeConfig.iconTheme,
    splashColor: palette.primary.shade200,
  );
}
