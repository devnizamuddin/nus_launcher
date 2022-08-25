import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nus_launcher/app/config/app_config.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.APP_NAME,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
