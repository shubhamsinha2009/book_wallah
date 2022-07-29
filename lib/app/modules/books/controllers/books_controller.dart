import 'package:books_wallah/app/data/model/subjects.dart';
import 'package:get/get.dart';

import '../../../data/model/books.dart';
import '../../home/controllers/home_controller.dart';

class BooksController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  // final isBodyBannerAdLoaded = false.obs;
  // late BannerAd bodyBannerAd;
  final bookList = <Book>[].obs;
  final homeController = Get.find<HomeController>();
  final subjects = Get.arguments as Subject;

  void filterfileList(String fileName) {
    if (fileName.isEmpty) {
      bookList.assignAll(subjects.booksList);
    } else {
      bookList.assignAll(subjects.booksList
          .where((books) =>
              books.bookName.toLowerCase().contains(fileName.toLowerCase()))
          .toList());
    }
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.booksBottomBanner,
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

  // void _createBodyBannerAd() {
  //   bodyBannerAd = BannerAd(
  //     adUnitId: AdHelper.booksBodyBanner,
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
  //     bodyBannerAd.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  @override
  void onInit() {
    bookList.assignAll(subjects.booksList);
    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    //   _createBodyBannerAd();
    // }
    super.onInit();
  }
}
