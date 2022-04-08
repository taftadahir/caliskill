import 'package:caliskill/configs/palette.dart';
import 'package:caliskill/configs/style_config.dart';
import 'package:caliskill/configs/theme_config.dart';
import 'package:caliskill/constants/layout_constant.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgramDayBottomSheetComponent extends StatelessWidget {
  const ProgramDayBottomSheetComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (ProgramController controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: LayoutConstant.kHorizontalScreenPadding,
              right: LayoutConstant.kHorizontalScreenPadding,
              top: LayoutConstant.kSpaceBetweenGroups,
              bottom: LayoutConstant.kSpaceBetweenTitleAndCards,
            ),
            child: Text(
              'Choose the day',
              style: Get.theme.textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 280 * LayoutConstant.kScaleFactor,
            child: GridView.count(
              crossAxisCount: LayoutConstant.kGridColumn,
              physics: ThemeConfig.kPhysics,
              padding: EdgeInsets.symmetric(
                horizontal: LayoutConstant.kHorizontalScreenPadding,
                vertical: LayoutConstant.kVerticalScreenPadding,
              ),
              mainAxisSpacing: LayoutConstant.kSpaceBetweenCards,
              crossAxisSpacing: LayoutConstant.kSpaceBetweenCards,
              children: List.generate(
                controller.program.days ?? 0,
                (index) => TextButton(
                  style: StyleConfig.buttonStyleFullWidth.copyWith(
                    backgroundColor: MaterialStateProperty.all(
                        controller.selectedDay == index + 1
                            ? palette.primary.shade500
                            : Colors.transparent),
                    foregroundColor: MaterialStateProperty.all(
                      controller.selectedDay == index + 1
                          ? palette.primary.shade50
                          : (index < controller.lastCompletedDay
                              ? palette.neutral.shade200
                              : palette.primary.shade900),
                    ),
                    fixedSize: MaterialStateProperty.all(null),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                    ),
                  ),
                  child: Text('${index + 1}'),
                  onPressed: index < controller.lastCompletedDay
                      ? null
                      : () {
                          ProgramController controller = Get.find();
                          controller.selectedDay = index + 1;
                          Get.back();
                        },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
