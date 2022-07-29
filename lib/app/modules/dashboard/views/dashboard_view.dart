import 'package:auto_size_text/auto_size_text.dart';
import 'package:books_wallah/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: Obx(() => GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2, maxCrossAxisExtent: 250),
                itemCount: controller.dashboardList.length,
                itemBuilder: (context, index) => Obx(
                  () => GestureDetector(
                    onTap: () => Get.toNamed(Routes.subject,
                        arguments: controller.dashboardList[index]),
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
                                color:
                                    controller.homeController.changeTheme.isTrue
                                        ? Colors.grey.shade900
                                        : Colors.grey.shade400,
                                offset: const Offset(5, 5),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color:
                                    controller.homeController.changeTheme.isTrue
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade300,
                                offset: const Offset(-4, -4),
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ]),
                        child: AutoSizeText(
                          controller.dashboardList[index].classNumber,
                          //controller.subjectList[index].subject

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
    );
  }
}
