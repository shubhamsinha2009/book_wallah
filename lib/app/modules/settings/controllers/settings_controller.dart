import 'package:get/get.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';

class SettingsController extends GetxController {
  final isSettingsBannerAdLoaded = false.obs;
  // late BannerAd settingsBannerAd;

  // void _createBottomBannerAd() {
  //   settingsBannerAd = BannerAd(
  //     adUnitId: AdHelper.settingsBanner,
  //     size: AdSize.banner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isSettingsBannerAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   if (isSettingsBannerAdLoaded.isFalse) {
  //     settingsBannerAd.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  // @override
  // void onInit() {
  //   // _createBottomBannerAd();
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   // settingsBannerAd.dispose();
  //   super.onClose();
  // }
}
