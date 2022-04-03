import 'package:flutter/material.dart';

class Palette {
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor success;
  final MaterialColor warning;
  final MaterialColor error;
  final MaterialColor neutral;

  Palette({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.neutral,
  }) : super();
}

Palette get palette => Palette(
      // Primary
      primary: const MaterialColor(
        0xff326CEC,
        {
          50: Color(0xffebf0fd),
          100: Color(0xffbfd1f9),
          200: Color(0xffa1bbf6),
          300: Color(0xff769df2),
          400: Color(0xff5b89f0),
          500: Color(0xff326cec),
          600: Color(0xff2e62d7),
          700: Color(0xff244da8),
          800: Color(0xff1c3b82),
          900: Color(0xff152d63),
        },
      ),
      // Secondary
      secondary: const MaterialColor(
        0xffEC6532,
        {
          50: Color(0xfffdf0eb),
          100: Color(0xfff9cfbf),
          200: Color(0xfff6b8a1),
          300: Color(0xfff29876),
          400: Color(0xfff0845b),
          500: Color(0xffec6532),
          600: Color(0xffd75c2e),
          700: Color(0xffa84824),
          800: Color(0xff82381c),
          900: Color(0xff632a15),
        },
      ),
      // Success
      success: const MaterialColor(
        0xff32EC78,
        {
          50: Color(0xffebfdf2),
          100: Color(0xffbff9d5),
          200: Color(0xffa1f6c1),
          300: Color(0xff76f2a5),
          400: Color(0xff5bf093),
          500: Color(0xff32ec78),
          600: Color(0xff2ed76d),
          700: Color(0xff24a855),
          800: Color(0xff1c8242),
          900: Color(0xff156332),
        },
      ),
      // Warning
      warning: const MaterialColor(
        0xffECC432,
        {
          50: Color(0xfffdf9eb),
          100: Color(0xfff9edbf),
          200: Color(0xfff6e4a1),
          300: Color(0xfff2d776),
          400: Color(0xfff0d05b),
          500: Color(0xffecc432),
          600: Color(0xffd7b22e),
          700: Color(0xffa88b24),
          800: Color(0xff826c1c),
          900: Color(0xff635215),
        },
      ),
      // Error
      error: const MaterialColor(
        0xffEC3252,
        {
          50: Color(0xfffdebee),
          100: Color(0xfff9bfc9),
          200: Color(0xfff6a1af),
          300: Color(0xfff2768b),
          400: Color(0xfff05b75),
          500: Color(0xffec3252),
          600: Color(0xffd72e4b),
          700: Color(0xffa8243a),
          800: Color(0xff821c2d),
          900: Color(0xff631522),
        },
      ),
      // Neutral
      neutral: const MaterialColor(
        0xff03102c,
        {
          50: Color(0xffe6e7ea),
          100: Color(0xffb1b5be),
          200: Color(0xff8b919e),
          300: Color(0xff565f72),
          400: Color(0xff354056),
          500: Color(0xff03102c),
          600: Color(0xff030f28),
          700: Color(0xff020b1f),
          800: Color(0xff020918),
          900: Color(0xff010712),
        },
      ),
    );
