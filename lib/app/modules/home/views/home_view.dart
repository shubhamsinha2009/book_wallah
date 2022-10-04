import 'package:books_wallah/app/modules/coins/controllers/coins_controller.dart';
import 'package:books_wallah/app/modules/coins/views/coins_view.dart';
import 'package:books_wallah/app/modules/downloaded/views/downloaded_view.dart';
import 'package:books_wallah/app/modules/importpdf/views/importpdf_view.dart';
import 'package:books_wallah/app/modules/pdfs/views/pdfs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> bodyPages = [
      const DashboardView(),
      const DownloadedView(),
      const PdfsView(),
      const SettingsView(),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //   onPressed: () => Get.toNamed(Routes.downloaded),
          //   icon: const Icon(Icons.download_rounded),
          // ),
          // IconButton(
          //   onPressed: () => Get.toNamed(Routes.whatsappChat),
          //   icon: const Icon(Icons.whatsapp_rounded),
          //),
          // Obx(() => controller.selectedBottom.value == 1
          //     ? IconButton(
          //         onPressed: () {
          //           Get.showSnackbar(GetSnackBar(
          //             backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
          //             title: 'How to delete file chapter fom device ?',
          //             message: 'Just Long Press on Chapter to delete',
          //             duration: const Duration(seconds: 5),
          //           ));
          //         },
          //         icon: const Icon(Icons.info))
          //     : const SizedBox(
          //         height: 0,
          //         width: 0,
          //       )),

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
          Obx(() => ActionChip(
                onPressed: () => showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  builder: (context) {
                    return const CoinsView();
                  },
                ),
                avatar: const Icon(
                  Icons.currency_bitcoin,
                ),
                label: Text('${Get.find<CoinsController>().coins.value}'),
                shape: const StadiumBorder(),
              )),
        ],
        // leadingWidth: 40,

        title: const FittedBox(
          child: Text(
            "Books Wallah",
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Obx(() => controller.selectedBottom.value == 2
          ? const ImportpdfView()
          : const SizedBox(
              height: 0,
              width: 0,
            )),
      bottomNavigationBar: Obx(() => NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.my_library_books_rounded),
                selectedIcon: Icon(Icons.my_library_books_outlined),
                label: 'Library',
              ),
              NavigationDestination(
                icon: Icon(Icons.file_download_done_rounded),
                selectedIcon: Icon(Icons.file_download_done_outlined),
                label: 'Downloaded',
              ),
              NavigationDestination(
                icon: Icon(Icons.picture_as_pdf_rounded),
                selectedIcon: Icon(Icons.picture_as_pdf_outlined),
                label: 'Files',
              ),
              NavigationDestination(
                icon: Icon(Icons.manage_accounts_rounded),
                selectedIcon: Icon(Icons.manage_accounts_outlined),
                label: 'Settings',
              ),
            ],
            selectedIndex: controller.selectedBottom.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: controller.onBottomBarSelected,
          )),
      // drawer: const SettingsView(),
      body: Obx(() => bodyPages[controller.selectedBottom.value]),
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
