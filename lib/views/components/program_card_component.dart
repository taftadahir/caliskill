import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/constants/global_constant.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/models/program.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProgramCardComponent extends StatelessWidget {
  final Program program;

  const ProgramCardComponent({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _roundSize = 8 * LayoutConstant.kScaleFactor;
    final _height = 80 * LayoutConstant.kScaleFactor;
    return Card(
      color: palette.primary.shade50,
      elevation: LayoutConstant.kCardElevation,
      shadowColor: palette.primary.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_roundSize),
      ),
      child: InkWell(
        onTap: () {},
        child: Ink(
          height: _height,
          padding: EdgeInsets.symmetric(
            horizontal: 16 * LayoutConstant.kScaleFactor,
            vertical: 8 * LayoutConstant.kScaleFactor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: _buildWidgets(
              program: program,
              imgSize: 64 * LayoutConstant.kScaleFactor,
              context: context,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWidgets({
    required Program program,
    required double imgSize,
    required BuildContext context,
  }) {
    List<Widget> _widgets = [];

    if (program.image != null) {
      program.image!.endsWith('png')
          ? _widgets.add(
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  'assets/images/programs/${program.image}',
                  fit: BoxFit.cover,
                  width: imgSize,
                  height: imgSize,
                ),
              ),
            )
          : _widgets.add(
              SvgPicture.asset(
                'assets/images/programs/${program.image}',
                fit: BoxFit.cover,
                width: imgSize,
                height: imgSize,
              ),
            );
    }

    _widgets.add(
      SizedBox(
        width: 32 * LayoutConstant.kScaleFactor,
      ),
    );

    List<Widget> _colWidgets = [
      Text(
        program.name,
        style: context.theme.textTheme.labelMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: GlobalConstant.kProgramCardTitleNumberOfLine,
      ),
    ];

    if (program.days != null) {
      _colWidgets.add(SizedBox(
        height: 4 * LayoutConstant.kScaleFactor,
      ));
      _colWidgets.add(
        Text(
          '${program.days} days',
          style: context.theme.textTheme.headlineSmall,
        ),
      );
    }
    _widgets.add(
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: _colWidgets,
        ),
      ),
    );
    return _widgets;
  }
}
