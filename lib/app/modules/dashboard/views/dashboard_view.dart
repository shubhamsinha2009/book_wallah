import 'package:books_wallah/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.isFalse
        ? Column(
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

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8),
              //   child: DropdownButtonFormField<String>(
              //     alignment: Alignment.center,
              //     isDense: true,
              const Divider(),
              //     value: controller.dashboardList[0].classNumber,
              //     items: controller.dashboardList
              //         .map((e) => DropdownMenuItem<String>(
              //             value: e.classNumber, child: Text(e.classNumber)))
              //         .toList(),
              //     onChanged: (classNumber) async {
              //       if (classNumber != null && classNumber.isNotEmpty) {
              //         // controller.currentLink = link;
              //         // controller.isLoading.value = true;
              //         // await controller.getdetails(link);
              //       }
              //     },
              //     // borderRadius: const BorderRadius.all(Radius.circular(10)),
              //   ),
              // ),
              // Obx(
              //   () => controller.isBottomBannerAdLoaded.isTrue
              //       ? SizedBox(
              //           height: controller.bottomBannerAd.size.height.toDouble(),
              //           width: controller.bottomBannerAd.size.width.toDouble(),
              //           child: controller.adWidget(ad: controller.bottomBannerAd),
              //         )
              //       : const SizedBox(
              //           height: 0,
              //           width: 0,
              //         ),
              // ),
              SizedBox(
                  height: 35,
                  child: Obx(
                    (() => ReorderableListView.builder(
                          onReorder: controller.onReorder1,
                          itemCount: controller.dashboardList.length,
                          scrollController: controller.firstScroll,
                          itemBuilder: (context, index) {
                            return Padding(
                              key: ValueKey(index),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Obx(() => ChoiceChip(
                                    visualDensity:
                                        VisualDensity.adaptivePlatformDensity,
                                    label: Text(
                                      controller
                                          .dashboardList[index].classNumber,
                                    ),
                                    selected: controller.selectedIndex1.value ==
                                        index,
                                    backgroundColor: Colors.white12,
                                    onSelected: (value) {
                                      controller.selectedIndex1.value = index;
                                      controller.selectedIndex2.value = 0;
                                      controller.subjectList.assignAll(
                                          controller.dashboardList
                                              .elementAt(index)
                                              .subjectList);

                                      controller.bookList.assignAll(controller
                                          .subjectList
                                          .elementAt(0)
                                          .booksList);

                                      Hive.box('user')
                                          .put('selectedIndex1', index);
                                      Hive.box('user').put('firstScroll',
                                          controller.firstScroll.offset);
                                    },
                                  )),
                            );
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  )),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 35,
                  child: Obx(
                    (() => ReorderableListView.builder(
                          scrollController: controller.secondScroll,
                          onReorder: controller.onReorder2,
                          itemCount: controller.subjectList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              key: ValueKey(index),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Obx(() => ChoiceChip(
                                    visualDensity:
                                        VisualDensity.adaptivePlatformDensity,
                                    label: Text(
                                      controller.subjectList[index].subject,
                                    ),
                                    selected: controller.selectedIndex2.value ==
                                        index,
                                    backgroundColor: Colors.white12,
                                    onSelected: (value) {
                                      controller.selectedIndex2.value = index;
                                      controller.bookList.assignAll(controller
                                          .subjectList
                                          .elementAt(index)
                                          .booksList);
                                      Hive.box('user')
                                          .put('selectedIndex2', index);
                                      Hive.box('user').put('secondScroll',
                                          controller.secondScroll.offset);
                                    },
                                  )),
                            );
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  )),
              const Divider(),
              Expanded(
                child: Obx(() => ReorderableListView.builder(
                      scrollController: controller.thirdScroll,
                      onReorder: controller.onReorder3,
                      itemCount: controller.bookList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        key: ValueKey(index),
                        onTap: () => Get.toNamed(Routes.bookPage,
                            arguments: controller.bookList[index]),
                        child: Obx(
                          () => Container(
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
                                      controller
                                              .homeController.changeTheme.isTrue
                                          ? Colors.black54
                                          : Colors.white70,
                                      controller
                                              .homeController.changeTheme.isTrue
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
                              child: FittedBox(
                                child: Text(
                                  controller.bookList[index].bookName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    )),
              ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          ));
  }
}
