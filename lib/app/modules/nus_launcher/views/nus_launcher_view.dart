import 'package:device_apps/device_apps.dart';
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    child: Obx(() => (controller.applicationList.value.isEmpty)
                        ? const Center(child: CircularProgressIndicator())
                        : controller.searchList.value == null
                            ? GridView.count(
                                crossAxisCount: 4,
                                physics: const BouncingScrollPhysics(),
                                children: List.generate(controller.applicationList.value.length, (index) {
                                  Application application = controller.applicationList.value[index];
                                  return GestureDetector(
                                    onTap: () {
                                      DeviceApps.openApp(application.packageName);
                                    },
                                    child: Column(
                                      children: [
                                        Image.memory(
                                          (controller.applicationList.value[index] as ApplicationWithIcon).icon,
                                          width: 48,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          controller.applicationList.value[index].appName,
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
                              )
                            : controller.searchList.value!.isEmpty
                                ? const Center(child: CircularProgressIndicator())
                                : GridView.count(
                                    crossAxisCount: 4,
                                    physics: const BouncingScrollPhysics(),
                                    children: List.generate(controller.searchList.value?.length ?? 0, (index) {
                                      Application application = controller.applicationList.value[index];
                                      return GestureDetector(
                                        onTap: () {
                                          DeviceApps.openApp(application.packageName);
                                        },
                                        child: Column(
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
    ));
  }
}
