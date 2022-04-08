import 'package:get/get.dart';

class LayoutConstant {
  // Screen
  static double kHorizontalScreenPadding = 8.0 * kScaleFactor;
  static double kVerticalScreenPadding = 16.0 * kScaleFactor;
  static const double kMinScreenWidth = 320.0;
  static double kScaleFactor = Get.width / kMinScreenWidth;
  static double kExerciseCardSize = 120.0 * kScaleFactor;
  static const double kCardElevation = 2;
  static double kSpaceBetweenTitleAndCards = 16 * kScaleFactor;
  static double kSpaceBetweenCards = 8 * kScaleFactor;
  static double kSpaceBetweenGroups = 32 * kScaleFactor;
  static double kAppBarCollapsedHeight = 56 * kScaleFactor;
  static double kAppBarExpandedHeight = 280 * kScaleFactor;
  static const double kAppBarElevation = 0;
  static double kCardRadius = 8 * kScaleFactor;
  static int kGridColumn = 7;
}
