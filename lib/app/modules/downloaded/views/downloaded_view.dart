import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:books_wallah/app/core/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/downloaded_controller.dart';

class DownloadedView extends GetView<DownloadedController> {
  const DownloadedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const FittedBox(child: Text('Downloaded')),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  controller.homeController.changeTheme.toggle();
                },
                icon: Icon(
                  controller.homeController.changeTheme.isTrue
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ))),
            IconButton(
                onPressed: () {
                  Get.showSnackbar(GetSnackBar(
                    backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                    title: 'How to delete file chapter fom device ?',
                    message: 'Just Long Press on Chapter to delete',
                    duration: const Duration(seconds: 5),
                  ));
                },
                icon: const Icon(Icons.info)),
          ],
        ),
        // bottomNavigationBar: Obx(() => controller.isBottomBannerAdLoaded.isTrue
        //     ? SizedBox(
        //         height: controller.bottomBannerAd.size.height.toDouble(),
        //         width: controller.bottomBannerAd.size.width.toDouble(),
        //         child: controller.adWidget(ad: controller.bottomBannerAd),
        //       )
        //     : const SizedBox(
        //         height: 0,
        //         width: 0,
        //       )),
        body: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          backgroundColor: Colors.white,
          color: Colors.black87,
          strokeWidth: 4,
          displacement: 150,
          edgeOffset: 0,
          onRefresh: () async {
            controller.isLoading.value = true;
            controller.onInitialisation();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 1,
                  onChanged: (value) => controller.filterfileList(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    isDense: true,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => controller.isLoading.isFalse
                    ? controller.filesList.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.filesList.length,
                            //  +
                            //     (controller.isInlineBannerAdLoaded.isTrue &&
                            //             (controller.filesList.length >=
                            //                 controller.inlineAdIndex)
                            //         ? 1
                            //         : 0),
                            itemBuilder: (context, index) {
                              // if (controller.isInlineBannerAdLoaded.isTrue &&
                              //     index == controller.inlineAdIndex &&
                              //     (controller.filesList.length >=
                              //         controller.inlineAdIndex)) {
                              //   return Container(
                              //     padding: const EdgeInsets.only(
                              //       bottom: 10,
                              //     ),
                              //     width: controller.inlineBannerAd.size.width
                              //         .toDouble(),
                              //     height: controller.inlineBannerAd.size.height
                              //         .toDouble(),
                              //     child: controller.adWidget(
                              //         ad: controller.inlineBannerAd),
                              //   );
                              // } else {
                              final _currentfile =
                                  controller.filesList[index] as File;
                              return ListTile(
                                title: Text(
                                  _currentfile.name.split('.').first,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                                subtitle: Text(
                                  '${_currentfile.parent.parent.parent.name} - ${_currentfile.parent.parent.name} - ${_currentfile.parent.name}\n${controller.getSubtitle(
                                    bytes: _currentfile.lengthSync(),
                                    time: _currentfile.lastModifiedSync(),
                                  )}',
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                                isThreeLine: true,
                                // dense: true,
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                onLongPress: (() => Get.dialog(
                                      AlertDialog(
                                        backgroundColor: Get.isDarkMode
                                            ? Colors.black
                                            : Colors.white,
                                        title: Text(
                                          'Are you sure you wish to delete ${_currentfile.name}?',
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              if (Get.isOverlaysOpen) {
                                                Get.back();
                                              }
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (Get.isOverlaysOpen) {
                                                Get.back();
                                              }
                                              File(_currentfile.path)
                                                  .delete()
                                                  .then((value) {
                                                controller.onInitialisation();
                                                Get.showSnackbar(GetSnackBar(
                                                  backgroundColor: Get
                                                      .theme
                                                      .snackBarTheme
                                                      .backgroundColor!,
                                                  messageText:
                                                      const Text('Deleted'),
                                                  icon: const Icon(Icons
                                                      .delete_forever_rounded),
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  duration: const Duration(
                                                      seconds: 3),
                                                ));
                                              });
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                      barrierDismissible: false,
                                    )),
                                // minLeadingWidth: 0,
                                leading: Text('${index + 1}.',
                                    softWrap: true, textScaleFactor: 2),
                                onTap: () {
                                  // controller
                                  //     .showInterstitialAd()
                                  //     .catchError((e) {});
                                  Get.toNamed(Routes.viewPdf,
                                      arguments: _currentfile.path);
                                },
                              );
                              //}
                            })
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "No Downloaded Files Found ! ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.fade,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  controller.onInitialisation();
                                },
                                icon: const Icon(Icons.refresh),
                                label: const Text(
                                  'Refresh',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ],
                          )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
              ),
            ],
          ),
        ));
  }
}
