import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nus_launcher_controller.dart';

class NusLauncherView extends GetView<NusLauncherController> {
  const NusLauncherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(),
    ));
  }
}
