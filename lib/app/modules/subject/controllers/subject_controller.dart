import 'package:books_wallah/app/data/model/classes.dart';
import 'package:books_wallah/app/data/model/subjects.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class SubjectController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  // BannerAd? bottomBannerAd;
  // final isBodyBannerAdLoaded = false.obs;
  // BannerAd? bodyBannerAd;
  final subjectList = <Subject>[].obs;
  final homeController = Get.find<HomeController>();
  final classes = Get.arguments as Class;

  void filterfileList(String fileName) {
    if (fileName.isEmpty) {
      subjectList.assignAll(classes.subjectList);
    } else {
      subjectList.assignAll(classes.subjectList
          .where((subjects) =>
              subjects.subject.toLowerCase().contains(fileName.toLowerCase()))
          .toList());
    }
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.subjectbottomBanner,
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
  //     bottomBannerAd?.load();
  //   }
  // }

  // void _createBodyBannerAd() {
  //   bodyBannerAd = BannerAd(
  //     adUnitId: AdHelper.subjectBodyBanner,
  //     size: AdSize.largeBanner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isBodyBannerAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   if (isBodyBannerAdLoaded.isFalse) {
  //     bodyBannerAd?.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  @override
  void onInit() {
    subjectList.assignAll(classes.subjectList);
    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    //   _createBodyBannerAd();
    // }
    super.onInit();
  }
}
