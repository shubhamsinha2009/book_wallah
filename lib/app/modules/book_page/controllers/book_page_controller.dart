import 'dart:io';
import 'package:books_wallah/app/data/model/chapter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

import '../../../data/model/books.dart';
import '../../home/controllers/home_controller.dart';

class BookPageController extends GetxController {
  final book = Get.arguments as Book;
  String pathDir = '';
  final isReady = false.obs;
  final homeController = Get.find<HomeController>();
  // InterstitialAd? interstitialAd;
  // final int maxFailedLoadAttempts = 3;
  // int interstitialLoadAttempts = 0;
  // final adDismissed = false.obs;
  // final inlineAdIndex = 4;
  // BannerAd? inlineBannerAd;
  // final isInlineBannerAdLoaded = false.obs;
  // final isBottomBannerAdLoaded = false.obs;
  // BannerAd? bottomBannerAd;
  final chapterList = <Chapter>[].obs;

  Future<String> filesDocDir() async {
    //Get this App Document Directory
    //App Document Directory + folder name

    final Directory? _appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder = Directory(
        '${_appDocDir?.path}/downloads/${book.className}/${book.subject}/${book.bookName}');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  void filterfileList(String fileName) {
    if (fileName.isEmpty) {
      chapterList.assignAll(book.chapters);
    } else {
      chapterList.assignAll(book.chapters
          .where((chapter) => chapter.chapterName
              .toLowerCase()
              .contains(fileName.toLowerCase()))
          .toList());
    }
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.bookBottom,
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

  // void _createInlineBannerAd() {
  //   inlineBannerAd = BannerAd(
  //     adUnitId: AdHelper.bookBanner,
  //     size: AdSize.largeBanner,
  //     request: const AdRequest(),
  //     listener: BannerAdListener(
  //       onAdLoaded: (_) {
  //         isInlineBannerAdLoaded.value = true;
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //       },
  //     ),
  //   );
  //   if (isInlineBannerAdLoaded.isFalse) {
  //     inlineBannerAd?.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  // Future<void> createInterstitialAd() async {
  //   try {
  //     await InterstitialAd.load(
  //       adUnitId: AdHelper.openPdf,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           interstitialAd = ad;
  //           interstitialLoadAttempts = 0;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           interstitialLoadAttempts += 1;
  //           interstitialAd = null;
  //           if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
  //             createInterstitialAd();
  //           }
  //         },
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     Get.showSnackbar(GetSnackBar(
  //       backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
  //       title: 'Error',
  //       message: e.toString(),
  //       duration: const Duration(seconds: 5),
  //     ));
  //   }
  // }

  // Future<void> showInterstitialAd() async {
  //   try {
  //     if (interstitialAd != null) {
  //       interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //             ad.dispose();
  //             adDismissed.value = true;
  //             createInterstitialAd();
  //           },
  //           onAdFailedToShowFullScreenContent:
  //               (InterstitialAd ad, AdError error) {
  //             ad.dispose();
  //             createInterstitialAd();
  //           },
  //           onAdShowedFullScreenContent: (InterstitialAd ad) {});
  //       if (interstitialAd != null) {
  //         interstitialAd!.show();
  //       }
  //     }
  //   } on Exception catch (e) {
  //     Get.showSnackbar(GetSnackBar(
  //       backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
  //       title: 'Error',
  //       message: e.toString(),
  //       duration: const Duration(seconds: 5),
  //     ));
  //   }
  // }

  // int getListViewItemIndex(int index) {
  //   if (isInlineBannerAdLoaded.isTrue &&
  //       index >= inlineAdIndex &&
  //       (chapterList.length >= inlineAdIndex)) {
  //     return index - 1;
  //   }
  //   return index;
  // }

  @override
  void onInit() {
    chapterList.assignAll(book.chapters);
    filesDocDir()
        .then((value) => pathDir = value)
        .whenComplete(() => isReady.value = true);
    // if (kReleaseMode) {
    // createInterstitialAd();
    // _createInlineBannerAd();
    // _createBottomBannerAd();
    // }

    super.onInit();
  }

  @override
  void onClose() {
    // if (kReleaseMode) {
    // interstitialAd?.dispose();
    //   inlineBannerAd?.dispose();
    //   bottomBannerAd?.dispose();
    // }

    super.onClose();
  }
}
