import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class WhatsappChatController extends GetxController {
  String? phoneNumber;
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  final homeController = Get.find<HomeController>();

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.whattsappBanner,
  //     size: AdSize.mediumRectangle,
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

}
