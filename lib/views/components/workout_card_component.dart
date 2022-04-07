import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/constants/global_constant.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:caliskill/models/workout.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WorkoutCardComponent extends StatelessWidget {
  final Workout workout;

  const WorkoutCardComponent({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = 72 * LayoutConstant.kScaleFactor;
    return Container(
      height: _height,
      padding: EdgeInsets.symmetric(
        horizontal: 8 * LayoutConstant.kScaleFactor,
        vertical: 8 * LayoutConstant.kScaleFactor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _buildWidgets(
          workout: workout,
          imgSize: 64 * LayoutConstant.kScaleFactor,
          context: context,
        ),
      ),
    );
  }

  List<Widget> _buildWidgets({
    required Workout workout,
    required double imgSize,
    required BuildContext context,
  }) {
    List<Widget> _widgets = [];

    // Handling image nullability
    if (workout.exercise.image != null) {
      workout.exercise.image!.endsWith('png')
          ? _widgets.add(
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  'assets/images/exercises/${workout.exercise.image}',
                  fit: BoxFit.cover,
                  width: imgSize,
                  height: imgSize,
                ),
              ),
            )
          : _widgets.add(
              SvgPicture.asset(
                'assets/images/exercises/${workout.exercise.image}',
                fit: BoxFit.cover,
                width: imgSize,
                height: imgSize,
              ),
            );

      // Spacing between image and name/reps/time
      _widgets.add(
        SizedBox(
          width: 32 * LayoutConstant.kScaleFactor,
        ),
      );
    }

    // Add exercise name
    List<Widget> _colWidgets = [
      Text(
        workout.exercise.name,
        style: context.theme.textTheme.labelMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: GlobalConstant.kProgramCardTitleNumberOfLine,
      ),
    ];

    // Space between exercise.name and exercise.reps/exercise.time
    _colWidgets.add(
      SizedBox(
        height: 4 * LayoutConstant.kScaleFactor,
      ),
    );

    // Handle exercise details
    if (workout.exercise.repBased) {
      // Add reps detail
      _colWidgets.add(
        Text(
          'x${workout.reps}',
          style: context.theme.textTheme.headlineSmall,
        ),
      );
    } else {
      // Add time detail
      _colWidgets.add(
        Text(
          '${workout.time} sec',
          style: context.theme.textTheme.headlineSmall,
        ),
      );
    }

    List<Widget> _rowWidgets = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: _colWidgets,
      ),
    ];

    // Add edit button if it is a custom program
    if (workout.program.id == ProgramController.customProgram.id) {
      _rowWidgets.add(
        IconButton(
          onPressed: () {
            //  This is a workout from custom program, so redirect to edit workout
          },
          icon: Icon(
            EvaIcons.editOutline,
            color: palette.primary.shade100,
          ),
        ),
      );
    }

    // Add
    _widgets.add(
      Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _rowWidgets,
        ),
      ),
    );

    return _widgets;
  }
}
