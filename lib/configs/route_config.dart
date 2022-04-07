import 'package:caliskill/constants/route_constant.dart';
import 'package:caliskill/views/screens/home_screen.dart';
import 'package:caliskill/views/screens/program_screen.dart';
import 'package:get/get.dart';

class RouteConfig {
  static List<GetPage<dynamic>> get pages => [
        GetPage(
          name: RouteConstant.kHome,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RouteConstant.kProgram,
          page: () => const ProgramScreen(),
        ),
      ];

  static String get initial => RouteConstant.kHome;
}
