import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleConfig {
  static final textTheme = TextTheme(
    displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 18 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    displayLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 24 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 12 * LayoutConstant.kScaleFactor,
      color: palette.neutral.shade400,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 20 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 12 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16 * LayoutConstant.kScaleFactor,
      color: palette.neutral.shade500,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 12 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16 * LayoutConstant.kScaleFactor,
      color: palette.primary.shade900,
    ),
  );

  static final TextButtonThemeData textButtonStyle = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        palette.primary.shade500,
      ),
      foregroundColor: MaterialStateProperty.all(
        palette.primary.shade50,
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: 24 * LayoutConstant.kScaleFactor,
          vertical: 8 * LayoutConstant.kScaleFactor,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8 * LayoutConstant.kScaleFactor,
          ),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 16 * LayoutConstant.kScaleFactor,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
  );

  static final ButtonStyle buttonStyleFullWidth = ButtonStyle(
    fixedSize: MaterialStateProperty.all(
      Size(
        Get.size.width - 2 * LayoutConstant.kHorizontalScreenPadding,
        48 * LayoutConstant.kScaleFactor,
      ),
    ),
  );
}
