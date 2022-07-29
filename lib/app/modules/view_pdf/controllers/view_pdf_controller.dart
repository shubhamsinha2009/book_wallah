import 'dart:async';
import 'dart:io';
import 'package:alh_pdf_view/controller/alh_pdf_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:wakelock/wakelock.dart';

import '../../../core/services/getstorage.dart';
import '../../home/controllers/home_controller.dart';

class ViewPdfController extends GetxController {
  final swipehorizontal = false.obs;
  final totalPages = 0.obs;
  final isVisible = true.obs;
  late final String filePath;
  int intialPageNumber = 0;
  final currentPage = 0.obs;
  //double intialZoomFactor = 1.0;
  late File file;
  //InterstitialAd? interstitialAd;
  final int maxFailedLoadAttempts = 3;
  int interstitialLoadAttempts = 0;
  final adDismissed = false.obs;
  Timer? _timer1;
  final isInterstitialAdLoaded = false.obs;
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  final countdownTimer = 300.obs;
  final homeController = Get.find<HomeController>();
  // RewardedInterstitialAd? rewardedInterstitialAd;
  // final isRewardedAdReady = false.obs;
  // int rewardLoadAttempts = 0;
  AlhPdfViewController? pdfViewController;
  static const double _zoomFactor = 0.1;
  List<int> pagesChanged = [];
  int? gotopage;
  int pageTimer = 0;
  // final fullScreen = false.obs;

  // Future<void> createInterstitialAd() async {
  //   try {
  //     await InterstitialAd.load(
  //       adUnitId: AdHelper.viewPdf,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           interstitialAd = ad;
  //           interstitialLoadAttempts = 0;
  //           isInterstitialAdLoaded.value = true;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           interstitialLoadAttempts += 1;
  //           interstitialAd = null;
  //           isInterstitialAdLoaded.value = false;
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

  // Future<void> createRewardedAd() async {
  //   await RewardedInterstitialAd.load(
  //     adUnitId: AdHelper.rewardedAd,
  //     request: const AdRequest(),
  //     rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
  //       onAdLoaded: (RewardedInterstitialAd ad) {
  //         rewardedInterstitialAd = ad;
  //         rewardLoadAttempts = 0;

  //         ad.fullScreenContentCallback = FullScreenContentCallback(
  //           onAdDismissedFullScreenContent: (ad) {
  //             isRewardedAdReady.value = false;

  //             createRewardedAd();
  //           },
  //         );

  //         isRewardedAdReady.value = true;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         // print('Failed to load a rewarded ad: ${err.message}');
  //         rewardLoadAttempts += 1;
  //         if (rewardLoadAttempts <= maxFailedLoadAttempts) {
  //           createRewardedAd();
  //         }
  //       },
  //     ),
  //   );
  // }

  void undoPage() {
    if (pdfViewController != null &&
        pagesChanged.first != currentPage.value &&
        pagesChanged.contains(currentPage.value)) {
      pdfViewController!.setPage(
          page: pagesChanged
              .elementAt(pagesChanged.indexOf(currentPage.value) - 1));
    }
  }

  void handleTapPreviousPage() {
    if (pdfViewController != null && currentPage.value != 0) {
      pdfViewController!.setPageWithAnimation(page: currentPage.value - 1);
    }
  }

  void handleTapNextPage() {
    if (pdfViewController != null && currentPage.value != totalPages.value) {
      pdfViewController!.setPageWithAnimation(page: currentPage.value + 1);
    }
  }

  void redoPage() {
    if (pdfViewController != null &&
        pagesChanged.last != currentPage.value &&
        pagesChanged.contains(currentPage.value)) {
      pdfViewController!.setPage(
          page: pagesChanged
              .elementAt(pagesChanged.indexOf(currentPage.value) + 1));
    }
  }

  Future<void> handleTapZoomOut() async {
    if (pdfViewController != null) {
      final currentZoom = await pdfViewController!.getZoom();
      await pdfViewController!.setZoom(zoom: currentZoom - _zoomFactor);
    }
  }

  Future<void> handleTappZoomIn() async {
    if (pdfViewController != null) {
      final currentZoom = await pdfViewController!.getZoom();
      await pdfViewController!.setZoom(zoom: currentZoom + _zoomFactor);
    }
  }

  Future<void> goToPage(int page) async {
    if (pdfViewController != null) {
      await pdfViewController!.setPage(
        page: page,
      );
    }
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.viewPdfBanner,
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
  void onInit() async {
    filePath = Get.arguments;

    final Map<String, dynamic>? _pdfDetails =
        GetStorageDbService.getRead(key: filePath);
    intialPageNumber = _pdfDetails?['intialPageNumber'] ?? 0;
    swipehorizontal.value = _pdfDetails?['swipehorizontal'] ?? false;
    currentPage.value = intialPageNumber;
    pagesChanged.add(currentPage.value);
    //  intialZoomFactor = _pdfDetails?['intialZoomFactor'] ?? 1.0;

    _timer1 = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        // if (countdownTimer.value == 0) {
        //   showInterstitialAd()
        //       .then((value) => countdownTimer.value = 200)
        //       .catchError((e) {});
        // } else {
        //   countdownTimer.value--;
        // }
        if (pageTimer >= 3) {
          if (pagesChanged.contains(currentPage.value)) {
            pagesChanged.remove(currentPage.value);
          }
          pagesChanged.add(currentPage.value);
          debugPrint(pagesChanged.toString());
          pageTimer = 0;
        }
        pageTimer++;
      },
    );

    try {
      // if (kReleaseMode) {
      //   _createBottomBannerAd();
      // createRewardedAd();
      // createInterstitialAd();
      //}
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Get.theme.snackBarTheme.backgroundColor!,
        title: 'Error',
        message: e.toString(),
        duration: const Duration(seconds: 5),
      ));
    }
    Wakelock.toggle(enable: true);
    super.onInit();
  }

  @override
  void onClose() async {
    _timer1?.cancel();

    //  if (kReleaseMode) {
    // interstitialAd?.dispose();
    //  bottomBannerAd.dispose();
    // rewardedInterstitialAd?.dispose();
    // }
    final Map<String, dynamic> _pdfDetails = {
      'intialPageNumber': intialPageNumber,
      'swipehorizontal': swipehorizontal.value,
      // 'intialZoomFactor': intialZoomFactor,
    };
    GetStorageDbService.getWrite(key: filePath, value: _pdfDetails);
  }
}
