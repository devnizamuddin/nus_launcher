import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nus_launcher/app/components/all_apps_view.dart';
import 'package:nus_launcher/app/utils/date.dart';

import '../controllers/nus_launcher_controller.dart';

class NusLauncherView extends GetView<NusLauncherController> {
  const NusLauncherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Obx(() => Opacity(
                opacity: 1,
                child: Container(
                  height: double.maxFinite,
                  child: controller.byteWallpaper.value == null
                      ? Container(
                          height: 120,
                          width: 140,
                          child: Text(''),
                        )
                      : Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          child: Image.memory(
                            controller.byteWallpaper.value!,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              )),
          PageView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getFormatedTime(controller.dateTime),
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Text(
                              getFormatedDate(controller.dateTime),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Image(height: width / 2, width: width / 2, image: AssetImage(AppAssets.ASSET_NUS_LAUNCHER_LOGO))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                        child: Obx(() => (controller.applicationList.value.isEmpty)
                            ? const Center(child: CircularProgressIndicator())
                            : controller.searchList.value == null
                                ? AllAppsView(applicationList: controller.applicationList)
                                : controller.searchList.value!.isEmpty
                                    ? const Center(child: CircularProgressIndicator())
                                    : GridView.count(
                                        crossAxisCount: 4,
                                        physics: const BouncingScrollPhysics(),
                                        children: List.generate(controller.searchList.value?.length ?? 0, (index) {
                                          debugPrint('Viewing SearchView');
                                          Application application = controller.applicationList.value[index];
                                          return GestureDetector(
                                            onTap: () {
                                              DeviceApps.openApp(application.packageName);
                                            },
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.memory(
                                                  (controller.searchList.value?[index] as ApplicationWithIcon).icon,
                                                  width: 48,
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  controller.searchList.value?[index].appName ?? '',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                      ))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: controller.searchController,
                        onChanged: controller.onChangeWhenTypeSearch,
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          suffixIcon: const Icon(Icons.search, color: Colors.grey),
                          contentPadding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
