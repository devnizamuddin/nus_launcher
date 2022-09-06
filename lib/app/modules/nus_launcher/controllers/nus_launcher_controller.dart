import 'dart:ffi';
import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NusLauncherController extends GetxController {
  RxList<Application> applicationList = <Application>[].obs;
  Rx<List<Application>?> searchList = Rx(null);
  late TextEditingController searchController;

  DateTime dateTime = DateTime.now();
  static const wallpaperChannel = MethodChannel('wallpaper');
  Rx<Uint8List?> byteWallpaper = Rx(null);

  Future getWallpaper() async {
    // final arguments = {
    //   'name': 'testing'
    // };
    //await wallpaperChannel.invokeListMethod('getWallpaper', arguments);
    byteWallpaper.value = await wallpaperChannel.invokeMethod('getWallpaper');
    if (byteWallpaper.value == null) {
      getWallpaper();
    }
    debugPrint('String image = $byteWallpaper');
  }

  getAllApplication() async {
    applicationList.value = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
  }

  void onChangeWhenTypeSearch(String searchedText) {
    final List<Application> tempList = [];
    if (searchedText.isNotEmpty) {
      for (final application in applicationList) {
        if (application.appName.toLowerCase().contains(searchController.text.toLowerCase())) {
          tempList.add(application);
        }
      }
      if (tempList.isEmpty) {
        searchList.value = [];
      } else {
        searchList.value = tempList;
      }
    } else {
      searchList.value = null;
    }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    getWallpaper();
    getAllApplication();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
  }
}
