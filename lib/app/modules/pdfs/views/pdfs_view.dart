import 'dart:io';

import 'package:books_wallah/app/core/extensions.dart';
import 'package:books_wallah/app/core/services/enum/enum.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../routes/app_pages.dart';
import '../../coins/controllers/coins_controller.dart';
import '../../coins/views/coins_view.dart';
import '../controllers/pdfs_controller.dart';
import '../local_widgets/btm_sheet.dart';

class PdfsView extends GetView<PdfsController> {
  const PdfsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
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
                          final currentfile =
                              controller.filesList[index] as File;
                          return ListTile(
                            title: Text(
                              currentfile.name.split('.').first,
                            ),
                            subtitle: Text(
                              controller.getSubtitle(
                                bytes: currentfile.lengthSync(),
                                time: currentfile.lastModifiedSync(),
                              ),
                            ),

                            trailing: PopupMenuButton(
                              onSelected: (value) {
                                switch (value) {
                                  case FileMenu.delete:
                                    Get.dialog(
                                      AlertDialog(
                                        title: Text(
                                          'Are you sure you wish to delete ${currentfile.name}?',
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
                                              File(currentfile.path)
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
                                    );
                                    break;
                                  case FileMenu.rename:
                                    Get.bottomSheet(
                                        BtmSheet(
                                          controller: controller,
                                          file: currentfile,
                                        ),
                                        isScrollControlled: true);
                                    break;
                                  default:
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    value: FileMenu.delete,
                                    child: Text('Delete'),
                                  ),
                                  const PopupMenuItem(
                                      value: FileMenu.rename,
                                      child: Text('Rename'))
                                ];
                              },
                            ),

                            // minLeadingWidth: 0,
                            // leading: Text('${index + 1}.',
                            //     softWrap: true, textScaleFactor: 2),
                            onTap: () {
                              if (Get.find<CoinsController>().coins.value > 0) {
                                Get.find<CoinsController>().coins.value--;
                                Hive.box('user').put('coins',
                                    Get.find<CoinsController>().coins.value);
                                Get.toNamed(Routes.viewPdf,
                                    arguments: currentfile.path);
                              } else {
                                showModalBottomSheet(
                                  isDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return const CoinsView();
                                  },
                                );
                              }
                              // controller
                              //     .showInterstitialAd()
                              //     .catchError((e) {});
                            },
                          );
                          //}
                        })
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Import Pdf Files to View! ",
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
    );
  }
}
