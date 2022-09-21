import 'dart:io';

import 'package:alh_pdf_view/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/view_pdf_controller.dart';

class ViewPdfView extends GetView<ViewPdfController> {
  const ViewPdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => controller.isInterstitialAdLoaded.isTrue
            ? Chip(
                label: Text(
                  'Ad in ${controller.countdownTimer.value} sec',
                  softWrap: true,
                ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              )),
        titleSpacing: 0,
        actions: [
          // IconButton(
          //     onPressed: () async => controller.rewardedInterstitialAd != null
          //         ? Get.dialog(AlertDialog(
          //             title: const Text('Rewarded Feature'),
          //             content: const Text(
          //                 'Please watch full rewarded ad to share files or save it'),
          //             backgroundColor:
          //                 Get.isDarkMode ? Colors.black : Colors.white,
          //             actions: [
          //               OutlinedButton(
          //                   onPressed: () => Get.back(),
          //                   child: const Text('Back')),
          //               OutlinedButton(
          //                   onPressed: () async {
          //                     try {
          //                       controller.rewardedInterstitialAd?.show(
          //                           onUserEarnedReward: (ad, reward) async {
          //                         await Share.shareFiles(
          //                           [controller.filePath],
          //                           text:
          //                               'Download Books Wallah App from Play Store  🔓',
          //                         );
          //                       });
          //                     } catch (e) {
          //                       await Share.shareFiles(
          //                         [controller.filePath],
          //                         text:
          //                             'Download Books Wallah App from Play Store  🔓',
          //                       );
          //                     }
          //                     Get.back();
          //                   },
          //                   child: const Text('Watch Rewarded Ad'))
          //             ],
          //           ))
          //         : await Share.shareFiles(
          //             [controller.filePath],
          //             text: 'Download Books Wallah App from Play Store  🔓',
          //           ),
          //     icon: const Icon(Icons.share)),
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
                controller.swipehorizontal.toggle();
              },
              icon: const Icon(Icons.rotate_90_degrees_ccw_outlined)),
          //IconButton(onPressed: (() => null), icon: Icon(Icons.bookmarks)),
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
      //         // child: Center(
      //         //   child: Text(
      //         //     controller.filePath.split('/').last.split('.').first,
      //         //     textAlign: TextAlign.center,
      //         //   ),
      //         // ),
      //       )),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniEndFloat,
      // floatingActionButton: FloatingActionButton.small(
      //     onPressed: () => controller.fullScreen.toggle(),
      //     child: const Icon(Icons.fullscreen)),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: controller.handleTapZoomOut,
            icon: const Icon(Icons.zoom_out),
          ),
          IconButton(
            onPressed: controller.undoPage,
            icon: const Icon(Icons.undo_rounded),
          ),
          IconButton(
            onPressed: controller.handleTapPreviousPage,
            icon: const Icon(Icons.navigate_before),
          ),
          ActionChip(
            label: Obx(() => Text(
                "${controller.currentPage.value + 1}/${controller.totalPages}")),
            onPressed: () {
              Get.dialog(AlertDialog(
                title: const Text('Go to Page'),
                content: TextFormField(
                  initialValue: '${controller.currentPage.value + 1}',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'Enter page numbber',
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (text) {
                    controller.gotopage = int.tryParse(text);
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }

                    if (controller.gotopage == null) {
                      return '"$text" is not a valid page number';
                    } else {
                      if (controller.gotopage! >= controller.totalPages.value ||
                          controller.gotopage! <= 0) {
                        return 'Page Not Exist';
                      }
                    }
                    return null;
                  },
                  autofocus: true,
                  keyboardType: TextInputType.number,
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () => Get.back(), child: const Text('Back')),
                  OutlinedButton(
                      onPressed: () {
                        if (controller.gotopage != null &&
                                (controller.gotopage! <
                                    controller.totalPages.value) ||
                            controller.gotopage! >= 0) {
                          Get.back();
                          controller.goToPage(controller.gotopage! - 1);
                        }
                      },
                      child: const Text('Go'))
                ],
              ));
            },
          ),
          IconButton(
            onPressed: controller.handleTapNextPage,
            icon: const Icon(Icons.navigate_next),
          ),
          IconButton(
            onPressed: controller.redoPage,
            icon: const Icon(Icons.redo_rounded),
          ),
          IconButton(
            onPressed: controller.handleTappZoomIn,
            icon: const Icon(Icons.zoom_in),
          ),
        ],
      ),

      // top: false,
      body: Obx(() => AlhPdfView(
            key: GlobalKey(),
            filePath: controller.filePath,
            enableSwipe: true,
            swipeHorizontal: controller.swipehorizontal.value,
            autoSpacing: false,
            pageFling: false,
            pageSnap: false,
            nightMode: controller.homeController.changeTheme.value,
            fitEachPage: true,
            fitPolicy: FitPolicy.width,
            defaultPage: controller.intialPageNumber,
            minZoom: 1,
            maxZoom: 5,
            enableDefaultScrollHandle: false,
            onRender: (pages) {
              // controller.isReady.value = true;

              controller.totalPages.value = pages;
            },
            // onZoomChanged: (value) {
            //   controller.intialZoomFactor = value;
            // },
            enableDoubleTap: true,
            //  defaultZoomFactor: controller.intialZoomFactor,
            onError: (error) {
              Get.dialog(
                WillPopScope(
                  onWillPop: () async => false,
                  child: AlertDialog(
                    alignment: Alignment.center,
                    title: const Text('Download Again !!!'),
                    content: const Text(
                      'Error : ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          try {
                            File(controller.filePath).deleteSync();
                            if (Get.isOverlaysOpen) {
                              Get.until(
                                  (route) => Get.currentRoute == Routes.home);
                            }
                            // Get.find<DownloadedController>()
                            //     .onInitialisation();
                          } catch (e) {
                            Get.showSnackbar(GetSnackBar(
                              backgroundColor:
                                  Get.theme.snackBarTheme.backgroundColor!,
                              title: 'Error',
                              message: e.toString(),
                              duration: const Duration(seconds: 5),
                            ));
                          }
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                barrierDismissible: false,
              );
            },
            onPageError: (page, error) {
              Get.showSnackbar(GetSnackBar(
                backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
                messageText:
                    Text('The Page  has an error : ${error.toString()}'),
                icon: const Icon(Icons.error_outline),
                snackPosition: SnackPosition.TOP,
                duration: const Duration(seconds: 3),
              ));
            },
            onViewCreated: (pdfViewController) {
              controller.pdfViewController = pdfViewController;
            },
            onPageChanged: (int? page, int? total) {
              if (page != null && total != null) {
                controller.intialPageNumber = page;
                controller.currentPage.value = page;
                controller.pageTimer = 0;
                //  controller.lastChanged = controller.pageTimer;
              } //  print('page change: /');
            },
          )),
    );
  }
}
