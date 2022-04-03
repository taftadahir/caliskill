import 'package:caliskill/configs/style_config.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullScreen;

  const ButtonComponent({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isFullScreen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: isFullScreen ? StyleConfig.buttonStyleFullWidth : null,
      child: Text(text),
    );
  }
}
