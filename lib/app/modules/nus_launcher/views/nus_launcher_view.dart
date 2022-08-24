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
            child: FutureBuilder(
              future: DeviceApps.getInstalledApplications(
                includeSystemApps: true,
                onlyAppsWithLaunchIntent: true,
              ),
              builder: (context, AsyncSnapshot<List<Application>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Application> allApps = snapshot.data!;
                  return GridView.count(
                    crossAxisCount: 4,
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(
                      allApps.length,
                      (index) => Text(
                        allApps[index].appName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    ));
  }
}
