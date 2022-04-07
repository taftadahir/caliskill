import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListHeadComponent extends StatelessWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;

  const ListHeadComponent({
    Key? key,
    required this.title,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.theme.textTheme.displayMedium,
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(iconData),
        ),
      ],
    );
  }
}
