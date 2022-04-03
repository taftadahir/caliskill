import 'package:get/get.dart';

class LayoutConstant {
  // Screen
  static double kHorizontalScreenPadding = 8.0 * kScaleFactor;
  static const double kMinScreenWidth = 320.0;
  static double kScaleFactor = Get.width / kMinScreenWidth;
  static double kExerciseCardSize = 120.0 * kScaleFactor;
  static const double kCardElevation = 2;
  static double spaceBetweenTitleAndCards = 16 * kScaleFactor;
  static double spaceBetweenCards = 8 * kScaleFactor;
  static double spaceBetweenGroups = 32 * kScaleFactor;
}
