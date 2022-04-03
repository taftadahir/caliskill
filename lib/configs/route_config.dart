import 'package:caliskill/constants/route_constant.dart';
import 'package:caliskill/views/screens/home_screen.dart';
import 'package:get/get.dart';

class RouteConfig {
  static List<GetPage<dynamic>> get pages => [
        GetPage(name: RouteConstant.kHome, page: () => const HomeScreen()),
      ];

  static String get initial => RouteConstant.kHome;
}
