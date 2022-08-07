import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_page_controller.dart';

class BookPageView extends GetView<BookPageController> {
  const BookPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(
            child: Text(
              controller.book.bookName,
            ),
          ),
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
        // bottomNavigationBar: Obx(() =>
        //     controller.isBottomBannerAdLoaded.isTrue &&
        //             controller.bottomBannerAd != null
        //         ? SizedBox(
        //             height: controller.bottomBannerAd?.size.height.toDouble(),
        //             width: controller.bottomBannerAd?.size.width.toDouble(),
        //             child: controller.adWidget(ad: controller.bottomBannerAd!),
        //           )
        //         : const SizedBox(
        //             height: 0,
        //             width: 0,
        //           )),
        body: Column(
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
              child: Obx(() => controller.isReady.isTrue
                  ? ListView.builder(
                      itemCount: controller.chapterList.length,
                      //  +
                      //     (controller.isInlineBannerAdLoaded.isTrue &&
                      //             (controller.chapterList.length >=
                      //                 controller.inlineAdIndex)
                      //         ? 1
                      //         : 0),
                      itemBuilder: (context, index) {
                        // if (controller.isInlineBannerAdLoaded.isTrue &&
                        //     controller.inlineBannerAd != null &&
                        //     index == controller.inlineAdIndex &&
                        //     (controller.chapterList.length >=
                        //         controller.inlineAdIndex)) {
                        //   return Container(
                        //     padding: const EdgeInsets.only(
                        //       bottom: 10,
                        //     ),
                        //     width: controller.inlineBannerAd?.size.width
                        //         .toDouble(),
                        //     height: controller.inlineBannerAd?.size.height
                        //         .toDouble(),
                        //     child: controller.adWidget(
                        //         ad: controller.inlineBannerAd!),
                        //   );
                        // } else {
                        String bookPath =
                            '${controller.pathDir}/${controller.chapterList[index].chapterName}.pdf';
                        return ListTile(
                          title:
                              Text(controller.chapterList[index].chapterName),
                          leading: Text('${index + 1}.',
                              softWrap: true, textScaleFactor: 1.5),
                          onLongPress: (() => File(bookPath).existsSync()
                              ? Get.dialog(
                                  AlertDialog(
                                    backgroundColor: Get.isDarkMode
                                        ? Colors.black
                                        : Colors.white,
                                    title: Text(
                                      'Are you sure you wish to delete ${controller.chapterList[index].chapterName}?',
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
                                          File(bookPath).delete().then(
                                              (value) =>
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
                                                  )));
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                  barrierDismissible: false,
                                )
                              : Get.showSnackbar(GetSnackBar(
                                  backgroundColor:
                                      Get.theme.snackBarTheme.backgroundColor!,
                                  title: 'Already deleted',
                                  message: 'Tap to download',
                                  duration: const Duration(seconds: 5),
                                ))),
                          // leading: Text('${index + 1}'),
                          onTap: () {
                            if (File(bookPath).existsSync()) {
                              // controller
                              //     .showInterstitialAd()
                              //     .catchError((e) {});
                              Get.toNamed(Routes.viewPdf, arguments: bookPath);
                            } else {
                              Get.toNamed(Routes.download, arguments: [
                                controller.chapterList[index],
                                bookPath
                              ]);
                            }
                          },
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
            ),
          ],
        ));
  }
}
