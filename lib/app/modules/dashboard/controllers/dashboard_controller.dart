import 'package:books_wallah/app/data/provider/class_list.dart';
import 'package:books_wallah/app/data/model/classes.dart';
import 'package:get/get.dart';
import '../../../data/model/subjects.dart';
import '../../home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;

  final dashboardList = <Class>[].obs;
  final homeController = Get.find<HomeController>();
  final subjectList = <Subject>[].obs;

  void filterfileList(String fileName) {
    if (fileName.isEmpty) {
      dashboardList.assignAll(classList);
    } else {
      dashboardList.assignAll(classList
          .where((classes) => classes.classNumber
              .toLowerCase()
              .contains(fileName.toLowerCase()))
          .toList());
    }
  }
  //  void filterfileList(String fileName) {
  //   if (fileName.isEmpty) {
  //     subjectList.assignAll(classes.subjectList);
  //   } else {
  //     subjectList.assignAll(classes.subjectList
  //         .where((subjects) =>
  //             subjects.subject.toLowerCase().contains(fileName.toLowerCase()))
  //         .toList());
  //   }
  // }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.dashboardBanner,
  //     size: AdSize.largeBanner,
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
    dashboardList.assignAll(classList);
    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    // }
    super.onInit();
  }
}
