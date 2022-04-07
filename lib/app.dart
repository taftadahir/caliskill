import 'package:caliskill/bindings/app_binding.dart';
import 'package:caliskill/configs/mode_config.dart';
import 'package:caliskill/configs/route_config.dart';
import 'package:caliskill/constants/global_constant.dart';
import 'package:caliskill/constants/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Remove splash screen after initialization is completed
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: GlobalConstant.kAppName,
      debugShowCheckedModeBanner: false,
      theme: Mode.light,
      themeMode: ThemeMode.light,
      getPages: RouteConfig.pages,
      initialBinding: AppBinding(),
      initialRoute : RouteConfig.initial,
      // initialRoute: RouteConstant.kProgram,
    );
  }
}
