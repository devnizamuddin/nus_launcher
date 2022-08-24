import 'package:get/get.dart';

import '../controllers/nus_launcher_controller.dart';

class NusLauncherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NusLauncherController>(
      () => NusLauncherController(),
    );
  }
}
