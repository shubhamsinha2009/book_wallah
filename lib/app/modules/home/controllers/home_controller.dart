import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:wakelock/wakelock.dart';

import '../../../core/services/getstorage.dart';

class HomeController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  final changeTheme = Get.isDarkMode.obs;
  //late BannerAd bottomBannerAd;

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.bottomBanner,
  //     size: AdSize.banner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isBottomBannerAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   if (isBottomBannerAdLoaded.isFalse) {
  //     bottomBannerAd.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  @override
  void onInit() {
    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    // }
    ever(
        changeTheme,
        (_) => GetStorageDbService.getWrite(
            key: 'darkmode', value: changeTheme.value));
    Wakelock.toggle(enable: true);
    super.onInit();
  }

  @override
  void onReady() {
    try {
      final newVersion = NewVersion(androidId: "com.sks.books_wallah");
      if (Get.context != null) {
        newVersion.getVersionStatus().then((status) {
          if (status != null && (status.localVersion != status.storeVersion)) {
            newVersion.showUpdateDialog(
              context: Get.context!,
              versionStatus: status,
              dialogTitle: 'Update Available',
              dialogText:
                  "What's New!\n${status.releaseNotes}\nYou can now update this app from ${status.localVersion} to ${status.storeVersion}",
            );
          }
        }).catchError((e) {
          //do Nothing
        });
      }
    } catch (e) {
      //do Nothing
    }

    super.onReady();
  }
}
