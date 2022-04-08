import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/configs/style_config.dart';
import 'package:caliskill/configs/theme_config.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/constants/route_constant.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:caliskill/models/workout_type.dart';
import 'package:caliskill/views/components/button_component.dart';
import 'package:caliskill/views/components/program_day_bottom_sheet_component.dart';
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
    double _roundPadding = 32;
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
                    onPressed: () {
                      Get.bottomSheet(
                        const ProgramDayBottomSheetComponent(),
                        backgroundColor: palette.primary.shade50,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        elevation: 0,
                        enableDrag: true,
                        barrierColor: palette.neutral.shade900.withOpacity(0.75),
                        enterBottomSheetDuration: ThemeConfig.animationDuration,
                        exitBottomSheetDuration: ThemeConfig.animationDuration,
                      );
                    },
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
                  top: _roundPadding,
                ),
                child: Material(
                  color: palette.primary.shade50,
                  child: ListView(
                    physics: ThemeConfig.kPhysics,
                    padding: EdgeInsets.only(
                      top:
                          LayoutConstant.kAppBarCollapsedHeight - _roundPadding,
                    ),
                    children: [
                      // Warm Up title
                      controller.program.id ==
                              ProgramController.customProgram.id
                          ? WorkoutListHeadComponent(
                              title: 'Warm Up',
                              iconData: EvaIcons.plusCircleOutline,
                              onTap: () {},
                            )
                          : WorkoutListHeadComponent(
                              title: 'Warm Up',
                              subTitle: controller
                                  .workouts(type: WorkoutType.warmUp)
                                  .length
                                  .toString(),
                            ),
                      ...controller
                          .workouts(type: WorkoutType.warmUp)
                          .map(
                            (workout) => Column(
                              children: [
                                WorkoutCardComponent(workout: workout),
                                Divider(
                                  color: palette.primary.shade200,
                                ),
                              ],
                            ),
                          )
                          .toList(),

                      // Workouts
                      SizedBox(
                        height: LayoutConstant.kSpaceBetweenGroups,
                      ),
                      controller.program.id ==
                              ProgramController.customProgram.id
                          ? WorkoutListHeadComponent(
                              title: 'Workouts',
                              iconData: EvaIcons.plusCircleOutline,
                              onTap: () {},
                            )
                          : WorkoutListHeadComponent(
                              title: 'Workouts',
                              subTitle: controller
                                  .workouts(
                                    type: WorkoutType.workout,
                                  )
                                  .length
                                  .toString(),
                            ),
                      ...controller
                          .workouts(type: WorkoutType.workout)
                          .map(
                            (workout) => Column(
                              children: [
                                WorkoutCardComponent(workout: workout),
                                Divider(
                                  color: palette.primary.shade200,
                                ),
                              ],
                            ),
                          )
                          .toList(),

                      // Stretch
                      SizedBox(
                        height: LayoutConstant.kSpaceBetweenGroups,
                      ),
                      controller.program.id ==
                              ProgramController.customProgram.id
                          ? WorkoutListHeadComponent(
                              title: 'Stretch',
                              iconData: EvaIcons.plusCircleOutline,
                              onTap: () {},
                            )
                          : WorkoutListHeadComponent(
                              title: 'Stretch',
                              subTitle: controller
                                  .workouts(
                                    type: WorkoutType.stretch,
                                  )
                                  .length
                                  .toString(),
                            ),
                      ...controller
                          .workouts(type: WorkoutType.stretch)
                          .map(
                            (workout) => Column(
                              children: [
                                WorkoutCardComponent(workout: workout),
                                Divider(
                                  color: palette.primary.shade200,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                      SizedBox(
                        height: 16 * LayoutConstant.kScaleFactor,
                      ),
                      ButtonComponent(
                        text: 'Start',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
                    ],
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
