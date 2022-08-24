import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nus_launcher_controller.dart';

class NusLauncherView extends GetView<NusLauncherController> {
  const NusLauncherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'NUS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text('Launcher', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
