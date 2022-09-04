import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class AllAppsView extends StatelessWidget {
  AllAppsView({Key? key, required this.applicationList}) : super(key: key);

  final RxList<Application> applicationList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (applicationList.isNotEmpty)
          ? ReorderableGridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: applicationList
                  .map((application) => Card(
                        key: ValueKey(application),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Image.memory((application as ApplicationWithIcon).icon, width: 48),
                          const SizedBox(height: 5),
                          Text(
                            application.appName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
                      ))
                  .toList(),
              onReorder: (oldIndex, newIndex) {
                // if (newIndex > oldIndex) {
                //   newIndex -= 1;
                // }
                final element = applicationList.removeAt(oldIndex);
                applicationList.insert(newIndex, element);
              },
              footer: [
                Card(
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
