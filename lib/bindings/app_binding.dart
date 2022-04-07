import 'package:caliskill/controllers/home_controller.dart';
import 'package:caliskill/controllers/program_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProgramController());
  }
}
