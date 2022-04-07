import 'package:caliskill/constants/layout_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutListHeadComponent extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData? iconData;
  final void Function()? onTap;

  const WorkoutListHeadComponent({
    Key? key,
    required this.title,
    this.subTitle,
    this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [
      Text(
        title,
        style: context.theme.textTheme.titleSmall,
      ),
    ];

    if (subTitle != null) {
      _widgets.add(Text(
        subTitle!,
        style: context.theme.textTheme.labelSmall,
      ));
    } else if (iconData != null) {
      _widgets.add(
        IconButton(
          onPressed: onTap,
          icon: Icon(iconData),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: 16,
        right: 8 * LayoutConstant.kScaleFactor,
        left: LayoutConstant.kScaleFactor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _widgets,
      ),
    );
  }
}
