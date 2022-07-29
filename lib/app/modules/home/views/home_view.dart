import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.downloaded),
            icon: const Icon(Icons.download_rounded),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.whatsappChat),
            icon: const Icon(Icons.whatsapp_rounded),
          ),
          Obx(() => IconButton(
              onPressed: () {
                Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                controller.changeTheme.toggle();
              },
              icon: Icon(
                controller.changeTheme.isTrue
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ))),
        ],
        // leadingWidth: 40,
        titleSpacing: 0,
        title: const FittedBox(
          child: Text(
            "Books Wallah",
            softWrap: true,
            textScaleFactor: 0.9,
          ),
        ),
      ),
      drawer: const SettingsView(),
      body: const DashboardView(),
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
      // )
    );
  }
}
