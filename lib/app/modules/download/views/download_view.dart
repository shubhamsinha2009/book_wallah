import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/download_controller.dart';

class DownloadView extends GetView<DownloadController> {
  const DownloadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const FittedBox(child: Text('Download')),
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
                    title: 'How to download file chapter  ?',
                    message:
                        'Just Press Button with download icon or try changing source link',
                    duration: const Duration(seconds: 5),
                  ));
                },
                icon: const Icon(Icons.info)),
          ],
        ),
        body: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                // controller.isBottomBannerAdLoaded.isTrue
                //     ? SizedBox(
                //         height:
                //             controller.bottomBannerAd.size.height.toDouble(),
                //         width: controller.bottomBannerAd.size.width.toDouble(),
                //         child:
                //             controller.adWidget(ad: controller.bottomBannerAd),
                //       )
                //     : const SizedBox(
                //         height: 0,
                //         width: 0,
                //       ),
                // const Spacer(),
                Text(
                  '${(controller.received.value / controller.total.value * 100).toStringAsFixed(0)} %',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    // color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: LinearProgressIndicator(
                    value: controller.received.value / controller.total.value,
                    backgroundColor: Colors.red[100],
                    valueColor: const AlwaysStoppedAnimation(Colors.red),
                    minHeight: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.chapter.chapterName,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButtonFormField<String>(
                    alignment: Alignment.center,
                    isDense: true,

                    value: controller.chapter.links[0].link,
                    items: controller.chapter.links
                        .map((e) => DropdownMenuItem<String>(
                            value: e.link,
                            child: Text('Source Link ${e.number}')))
                        .toList(),
                    onChanged: (link) async {
                      if (link != null && link.isNotEmpty) {
                        controller.currentLink = link;
                        controller.isLoading.value = true;
                        await controller.getdetails(link);
                      }
                    },
                    // borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                controller.isLoading.isFalse
                    ? controller.getDetails.isFalse
                        ? File(controller.bookPath).existsSync()
                            ? OutlinedButton.icon(
                                onPressed: () {
                                  // controller
                                  //     .showInterstitialAd()
                                  //     .catchError((e) {});

                                  Get.toNamed(
                                    Routes.viewPdf,
                                    arguments: controller.bookPath,
                                  );
                                },
                                icon: const Icon(Icons.folder_open),
                                label: const Text('Open File'),
                              )
                            : OutlinedButton.icon(
                                onPressed: () async {
                                  // controller
                                  //     .showInterstitialAd()
                                  //     .catchError((e) {});
                                  await controller
                                      .downloadFile(controller.bookPath);
                                },
                                icon: const Icon(Icons.file_download),
                                label: Text(
                                    '${controller.formatBytes(controller.received.value, 1)}/${controller.formatBytes(controller.total.value, 1)}'),
                              )
                        : OutlinedButton.icon(
                            onPressed: () async {
                              controller.isLoading.value = true;
                              await controller
                                  .getdetails(controller.currentLink);
                            },
                            icon: const Icon(Icons.refresh_rounded),
                            label: const Text('Retry'),
                          )
                    : const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 6,
                      )),
              ],
            )));
  }
}
