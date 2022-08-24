import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nus_launcher_controller.dart';

class NusLauncherView extends GetView<NusLauncherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NusLauncherView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NusLauncherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
