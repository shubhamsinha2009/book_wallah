import 'dart:io';
import 'dart:math';

import 'package:books_wallah/app/core/extensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../home/controllers/home_controller.dart';

class DownloadedController extends GetxController {
  final homeController = Get.find<HomeController>();
  // InterstitialAd? interstitialAd;
  // final int maxFailedLoadAttempts = 3;
  // int interstitialLoadAttempts = 0;
  // final adDismissed = false.obs;
  // final inlineAdIndex = 3;
  // late BannerAd inlineBannerAd;
  // final isInlineBannerAdLoaded = false.obs;
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  Directory? _mydir;
  final isLoading = true.obs;
  final filesList = <FileSystemEntity>[].obs;

  Future<String> filesDocDir() async {
    //Get this App Document Directory
    //App Document Directory + folder name

    final Directory? appDocDir = await getExternalStorageDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder = Directory('${appDocDir?.path}/downloads');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder =
          await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }

  // void _createBottomBannerAd() {
  //   bottomBannerAd = BannerAd(
  //     adUnitId: AdHelper.downoadBottomBanner,
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

  // void _createInlineBannerAd() {
  //   inlineBannerAd = BannerAd(
  //     adUnitId: AdHelper.downoadInlineBanner,
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
  //     inlineBannerAd.load();
  //   }
  // }

  // AdWidget adWidget({required AdWithView ad}) {
  //   return AdWidget(ad: ad);
  // }

  // int getListViewItemIndex(int index) {
  //   if (index >= inlineAdIndex &&
  //       isInlineBannerAdLoaded.isTrue &&
  //       (filesList.length >= inlineAdIndex)) {
  //     return index - 1;
  //   }
  //   return index;
  // }

  Future<void> onInitialisation() async {
    _mydir = Directory(await filesDocDir());
    if (_mydir != null) {
      filesList.assignAll(_mydir!
          .listSync(
            recursive: true,
          )
          .whereType<File>()
          .toList()
        ..sort(
          (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
        ));
      isLoading.value = false;
    }
  }

  void filterfileList(String fileName) {
    if (_mydir != null) {
      filesList.assignAll(_mydir!
          .listSync(
            recursive: true,
          )
          .whereType<File>()
          .toList()
          .where((FileSystemEntity element) =>
              element.name.toLowerCase().contains(fileName.toLowerCase()))
          .toList()
        ..sort(
          (a, b) => b.statSync().modified.compareTo(a.statSync().modified),
        ));
    }
  }

  // Future<void> createInterstitialAd() async {
  //   try {
  //     await InterstitialAd.load(
  //       adUnitId: AdHelper.viewBookPdf,
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

  String getSubtitle({required int bytes, required DateTime time}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${DateFormat.yMMMMd('en_US').add_jm().format(time)} - ${'${(bytes / pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}'}';
  }

  @override
  void onInit() async {
    await onInitialisation();
    //  if (kReleaseMode) {
    //createInterstitialAd();
    // _createInlineBannerAd();
    // _createBottomBannerAd();
    // }
    super.onInit();
  }

  @override
  void onClose() {
    // if (kReleaseMode) {
    // interstitialAd?.dispose();
    // inlineBannerAd.dispose();
    // bottomBannerAd.dispose();
    // }
    super.onClose();
  }
}
