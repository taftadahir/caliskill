import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExerciseCardComponent extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCardComponent({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.primary.shade50,
      elevation: LayoutConstant.kCardElevation,
      shadowColor: palette.primary.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LayoutConstant.kCardRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(LayoutConstant.kCardRadius),
        onTap: () {},
        child: Ink(
          width: LayoutConstant.kExerciseCardSize,
          height: LayoutConstant.kExerciseCardSize,
          child: Stack(
            alignment: exercise.image == null
                ? Alignment.center
                : Alignment.bottomCenter,
            children: _buildWidget(LayoutConstant.kCardRadius, context),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWidget(double _roundSize, BuildContext context) {
    List<Widget> _widgets = [];
    if (exercise.image != null) {
      _widgets.add(
        exercise.image!.endsWith('png')
            ? AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  'assets/images/exercises/${exercise.image}',
                  fit: BoxFit.cover,
                  width: LayoutConstant.kExerciseCardSize,
                  height: LayoutConstant.kExerciseCardSize,
                ),
              )
            : SvgPicture.asset(
                'assets/images/exercises/${exercise.image}',
                fit: BoxFit.cover,
              ),
      );
    }

    _widgets.add(
      Container(
        width: LayoutConstant.kExerciseCardSize,
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: palette.primary.shade50.withOpacity(0.4),
          borderRadius: BorderRadius.circular(_roundSize),
          boxShadow: [
            BoxShadow(
              color: palette.primary.shade50.withAlpha(160),
              offset: const Offset(0, -4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          exercise.name,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium,
        ),
      ),
    );
    return _widgets;
  }
}
