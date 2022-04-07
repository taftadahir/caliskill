import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/configs/style_config.dart';
import 'package:caliskill/configs/theme_config.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/constants/route_constant.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:caliskill/models/workout_type.dart';
import 'package:caliskill/views/components/workout_card_component.dart';
import 'package:caliskill/views/components/workout_list_head_component.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramScreen extends StatelessWidget {
  const ProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _roundSize = 24 * LayoutConstant.kScaleFactor;
    Color _backgroundColor = palette.primary.shade200;
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: GetBuilder(builder: (ProgramController controller) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: LayoutConstant.kAppBarElevation,
              expandedHeight: LayoutConstant.kAppBarExpandedHeight,
              collapsedHeight: LayoutConstant.kAppBarCollapsedHeight,
              backgroundColor: _backgroundColor,
              leading: IconButton(
                icon: Icon(
                  EvaIcons.arrowBackOutline,
                  color: palette.primary.shade900,
                ),
                onPressed: () {
                  Get.offNamed(RouteConstant.kHome);
                },
              ),
              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                double top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  expandedTitleScale: LayoutConstant.kScaleFactor,
                  title: Text(
                    controller.program.name,
                    style: Get.theme.textTheme.headlineMedium,
                  ),
                  titlePadding: EdgeInsets.only(
                    left: 24 +
                        24 *
                            LayoutConstant.kScaleFactor *
                            (LayoutConstant.kAppBarExpandedHeight - top) /
                            (LayoutConstant.kAppBarExpandedHeight -
                                LayoutConstant.kAppBarCollapsedHeight),
                    bottom: 16,
                  ),
                  background: Padding(
                    padding: EdgeInsets.all(16 * LayoutConstant.kScaleFactor),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        'assets/images/programs/${controller.program.image}',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                );
              }),
              actions: [
                Container(
                  margin: EdgeInsets.only(
                    right: LayoutConstant.kHorizontalScreenPadding,
                    top: 8,
                  ),
                  child: TextButton(
                    style: StyleConfig.buttonStyleFullWidth.copyWith(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 8,
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.all(palette.primary.shade900),
                      fixedSize: MaterialStateProperty.all(null),
                    ),
                    onPressed: () {},
                    child: Text('Day ${controller.selectedDay}'),
                  ),
                ),
              ],
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              child: Container(
                decoration: BoxDecoration(
                  color: palette.primary.shade50,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(_roundSize),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: LayoutConstant.kHorizontalScreenPadding,
                  right: LayoutConstant.kHorizontalScreenPadding,
                  top: LayoutConstant.kAppBarCollapsedHeight,
                ),
                child: ListView.separated(
                  physics: ThemeConfig.kPhysics,
                  itemCount: controller.workoutLength,
                  itemBuilder: (_, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WorkoutListHeadComponent(
                            title: 'Warm Up',
                            subTitle: controller
                                .workouts(type: WorkoutType.warmUp)
                                .length
                                .toString(),
                          ),
                          WorkoutCardComponent(
                            workout: controller.workouts()[index],
                          ),
                        ],
                      );
                    } else if (index ==
                        controller.workouts(type: WorkoutType.warmUp).length) {
                      return Column(
                        children: [
                          SizedBox(
                            height: LayoutConstant.kSpaceBetweenGroups,
                          ),
                          WorkoutListHeadComponent(
                            title: 'Workouts',
                            subTitle: controller
                                .workouts(
                                  type: WorkoutType.workout,
                                )
                                .length
                                .toString(),
                          ),
                          WorkoutCardComponent(
                            workout: controller.workouts()[index],
                          )
                        ],
                      );
                    } else if (index ==
                        controller.workouts(type: WorkoutType.workout).length +
                            controller
                                .workouts(type: WorkoutType.warmUp)
                                .length) {
                      return Column(
                        children: [
                          SizedBox(
                            height: LayoutConstant.kSpaceBetweenGroups,
                          ),
                          WorkoutListHeadComponent(
                            title: 'Stretch',
                            subTitle: controller
                                .workouts(
                                  type: WorkoutType.stretch,
                                )
                                .length
                                .toString(),
                          ),
                          WorkoutCardComponent(
                            workout: controller.workouts()[index],
                          )
                        ],
                      );
                    } else if (controller.workoutLength - 1 == index) {
                      return Column(
                        children: [
                          WorkoutCardComponent(
                            workout: controller.workouts()[index],
                          ),
                          const SizedBox(height: 24),
                        ],
                      );
                    }
                    return WorkoutCardComponent(
                      workout: controller.workouts()[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: palette.primary.shade200,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
