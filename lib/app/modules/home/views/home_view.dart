import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
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
    ));
  }
}
