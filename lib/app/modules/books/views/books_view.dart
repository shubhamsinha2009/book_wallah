import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/books_controller.dart';

class BooksView extends GetView<BooksController> {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            controller.subjects.subject,
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
        ],
      ),
      // bottomNavigationBar: Obx(
      //   () => controller.isBottomBannerAdLoaded.isTrue
      //       ? SizedBox(
      //           height: controller.bottomBannerAd.size.height.toDouble(),
      //           width: controller.bottomBannerAd.size.width.toDouble(),
      //           child: controller.adWidget(ad: controller.bottomBannerAd),
      //         )
      //       : const SizedBox(
      //           width: 0,
      //           height: 0,
      //         ),
      // ),
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
          // Obx(
          //   () => controller.isBodyBannerAdLoaded.isTrue
          //       ? SizedBox(
          //           height: controller.bodyBannerAd.size.height.toDouble(),
          //           width: controller.bodyBannerAd.size.width.toDouble(),
          //           child: controller.adWidget(ad: controller.bodyBannerAd),
          //         )
          //       : const SizedBox(
          //           height: 0,
          //           width: 0,
          //         ),
          // ),
          Expanded(
            child: Obx(() => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 2, maxCrossAxisExtent: 250),
                  itemCount: controller.bookList.length,
                  itemBuilder: (context, index) => Obx(
                    () => GestureDetector(
                      onTap: () => Get.toNamed(Routes.bookPage,
                          arguments: controller.bookList[index]),
                      child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 10,
                            right: 10,
                          ),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  controller.homeController.changeTheme.isTrue
                                      ? Colors.black54
                                      : Colors.white70,
                                  controller.homeController.changeTheme.isTrue
                                      ? Colors.black87
                                      : Colors.white,
                                ],
                              ),
                              //color: Colors.black87,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: controller
                                          .homeController.changeTheme.isTrue
                                      ? Colors.grey.shade900
                                      : Colors.grey.shade400,
                                  offset: const Offset(5, 5),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: controller
                                          .homeController.changeTheme.isTrue
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade300,
                                  offset: const Offset(-4, -4),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                )
                              ]),
                          child: AutoSizeText(
                            controller.bookList[index].bookName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          )),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
