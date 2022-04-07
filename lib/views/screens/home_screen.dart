import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/configs/theme_config.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/controllers/home_controller.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:caliskill/views/components/button_component.dart';
import 'package:caliskill/views/components/exercise_card_component.dart';
import 'package:caliskill/views/components/list_head_component.dart';
import 'package:caliskill/views/components/program_card_component.dart';
import 'package:caliskill/views/screens/program_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 72 * LayoutConstant.kScaleFactor,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.w600,
                      fontSize: 24 * LayoutConstant.kScaleFactor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Cali',
                        style: TextStyle(
                          color: palette.primary.shade500,
                        ),
                      ),
                      TextSpan(
                        text: 'skill',
                        style: TextStyle(
                          color: palette.secondary.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: ThemeConfig.kPhysics,
                children: [
                  Container(
                    color: palette.neutral.shade50,
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                      vertical: 24 * LayoutConstant.kScaleFactor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Good morning',
                          style: context.theme.textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: 8 * LayoutConstant.kScaleFactor,
                        ),
                        Text(
                          'Need a custom program?',
                          style: context.theme.textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 16 * LayoutConstant.kScaleFactor,
                        ),
                        ButtonComponent(
                          text: 'Custom program',
                          onPressed: () {
                            ProgramController _controller = Get.find();
                            _controller.program = ProgramController.customProgram;
                            Get.to(() => const ProgramScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: LayoutConstant.kSpaceBetweenGroups,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                    ),
                    child: ListHeadComponent(
                      title: 'Exercises',
                      iconData: EvaIcons.arrowCircleRightOutline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenTitleAndCards),
                  SizedBox(
                    height: LayoutConstant.kExerciseCardSize,
                    child: ListView.separated(
                      physics: ThemeConfig.kPhysics,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => index == 0 ||
                              index == HomeController.exercises.length - 1
                          ? Padding(
                              padding: EdgeInsets.only(
                                left: index == 0
                                    ? LayoutConstant.kHorizontalScreenPadding
                                    : 0,
                                right: index ==
                                        HomeController.exercises.length - 1
                                    ? LayoutConstant.kHorizontalScreenPadding
                                    : 0,
                              ),
                              child: ExerciseCardComponent(
                                exercise: HomeController.exercises[index],
                              ),
                            )
                          : ExerciseCardComponent(
                              exercise: HomeController.exercises[index],
                            ),
                      separatorBuilder: (_, index) =>
                          SizedBox(width: LayoutConstant.kSpaceBetweenCards),
                      itemCount: HomeController.exercises.length,
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenGroups),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                    ),
                    child: ListHeadComponent(
                      title: 'Level I skills',
                      iconData: EvaIcons.arrowCircleRightOutline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: LayoutConstant.kSpaceBetweenTitleAndCards,
                  ),
                  ...HomeController.levelOnePrograms.mapIndexed(
                    (index, program) => Padding(
                      padding: EdgeInsets.only(
                        left: LayoutConstant.kHorizontalScreenPadding,
                        right: LayoutConstant.kHorizontalScreenPadding,
                        bottom:
                            index == HomeController.levelOnePrograms.length - 1
                                ? 0
                                : LayoutConstant.kSpaceBetweenCards,
                      ),
                      child: ProgramCardComponent(program: program),
                    ),
                  ),
                  SizedBox(
                    height: 32 * LayoutConstant.kScaleFactor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                    ),
                    child: ListHeadComponent(
                      title: 'Level II skills',
                      iconData: EvaIcons.arrowCircleRightOutline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenTitleAndCards),
                  ...HomeController.levelTwoPrograms.mapIndexed(
                    (index, program) => Padding(
                      padding: EdgeInsets.only(
                        left: LayoutConstant.kHorizontalScreenPadding,
                        right: LayoutConstant.kHorizontalScreenPadding,
                        bottom:
                            index == HomeController.levelTwoPrograms.length - 1
                                ? 0
                                : LayoutConstant.kSpaceBetweenCards,
                      ),
                      child: ProgramCardComponent(program: program),
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenGroups),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                    ),
                    child: ListHeadComponent(
                      title: 'Level III skills',
                      iconData: EvaIcons.arrowCircleRightOutline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenTitleAndCards),
                  ...HomeController.levelThreePrograms.mapIndexed(
                    (index, program) => Padding(
                      padding: EdgeInsets.only(
                        left: LayoutConstant.kHorizontalScreenPadding,
                        right: LayoutConstant.kHorizontalScreenPadding,
                        bottom: index ==
                                HomeController.levelThreePrograms.length - 1
                            ? 0
                            : LayoutConstant.kSpaceBetweenCards,
                      ),
                      child: ProgramCardComponent(program: program),
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenGroups),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: LayoutConstant.kHorizontalScreenPadding,
                    ),
                    child: ListHeadComponent(
                      title: 'Master Level skills',
                      iconData: EvaIcons.arrowCircleRightOutline,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: LayoutConstant.kSpaceBetweenTitleAndCards),
                  ...HomeController.masterLevelPrograms.mapIndexed(
                    (index, program) => Padding(
                      padding: EdgeInsets.only(
                        left: LayoutConstant.kHorizontalScreenPadding,
                        right: LayoutConstant.kHorizontalScreenPadding,
                        bottom:
                            index == HomeController.masterLevelPrograms.length
                                ? 0
                                : LayoutConstant.kSpaceBetweenCards,
                      ),
                      child: ProgramCardComponent(program: program),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
