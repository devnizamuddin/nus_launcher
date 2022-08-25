import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NusLauncherController extends GetxController {
  Rx<List<Application>> applicationList = Rx([]);
  Rx<List<Application>?> searchList = Rx(null);
  late TextEditingController searchController;

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
      for (final application in applicationList.value) {
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
    getAllApplication();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
  }
}
