import 'package:books_wallah/app/data/model/classes.dart';
import 'package:books_wallah/app/data/provider/class_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data/model/books.dart';
import '../../../data/model/subjects.dart';
import '../../home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  // final isBottomBannerAdLoaded = false.obs;
  // late BannerAd bottomBannerAd;
  final isLoading = true.obs;

  final dashboardList = <Class>[].obs;
  final homeController = Get.find<HomeController>();
  final subjectList = <Subject>[].obs;
  final bookList = <Book>[].obs;

  ScrollController firstScroll = ScrollController(
      initialScrollOffset:
          Hive.box('user').get('firstScroll', defaultValue: 0.0));
  ScrollController secondScroll = ScrollController(
      initialScrollOffset:
          Hive.box('user').get('secondScroll', defaultValue: 0.0));
  ScrollController thirdScroll = ScrollController(
      initialScrollOffset:
          Hive.box('user').get('thirdScroll', defaultValue: 0.0));

  final selectedIndex1 =
      (Hive.box("user").get('selectedIndex1', defaultValue: 0) as int).obs;
  final selectedIndex2 =
      (Hive.box("user").get('selectedIndex2', defaultValue: 0) as int).obs;

  // void filterfileList(String fileName) {
  //   if (fileName.isEmpty) {
  //     dashboardList.assignAll(classList);

  //   } else {
  //     dashboardList.assignAll(classList
  //         .where((classes) => classes.classNumber
  //             .toLowerCase()
  //             .contains(fileName.toLowerCase()))
  //         .toList());
  //   }
  // }
  void filterfileList(String fileName) {
    if (fileName.isEmpty) {
      bookList.assignAll(subjectList.elementAt(selectedIndex2.value).booksList);
    } else {
      bookList.assignAll(subjectList
          .elementAt(selectedIndex2.value)
          .booksList
          .where((books) =>
              books.bookName.toLowerCase().contains(fileName.toLowerCase()))
          .toList());
    }
  }

//  void filterfileList(String fileName) {
//     if (fileName.isEmpty) {
//       subjectList.assignAll(classes.subjectList);
//     } else {
//       subjectList.assignAll(classes.subjectList
//           .where((subjects) =>
//               subjects.subject.toLowerCase().contains(fileName.toLowerCase()))
//           .toList());
//     }
//   }
  void onReorder1(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    if (selectedIndex1 == oldIndex) {
      selectedIndex1.value = newIndex;
      Hive.box('user').put('selectedIndex1', newIndex);
    }
    final element = dashboardList.removeAt(oldIndex);
    dashboardList.insert(newIndex, element);

    selectedIndex2.value = 0;
    subjectList
        .assignAll(dashboardList.elementAt(selectedIndex1.value).subjectList);
    bookList.assignAll(subjectList.elementAt(0).booksList);

    Hive.box("user").put('classList', dashboardList);
    Hive.box('user').put('firstScroll', firstScroll.offset);
  }

  void onReorder2(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    if (selectedIndex2 == oldIndex) {
      selectedIndex2.value = newIndex;
      Hive.box('user').put('selectedIndex2', newIndex);
    }
    final element = dashboardList
        .elementAt(selectedIndex1.value)
        .subjectList
        .removeAt(oldIndex);
    dashboardList
        .elementAt(selectedIndex1.value)
        .subjectList
        .insert(newIndex, element);

    subjectList
        .assignAll(dashboardList.elementAt(selectedIndex1.value).subjectList);

    bookList.assignAll(subjectList.elementAt(selectedIndex2.value).booksList);
    Hive.box("user").put('classList', dashboardList);

    Hive.box('user').put('secondScroll', secondScroll.offset);
  }

  void onReorder3(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }

    final element = dashboardList
        .elementAt(selectedIndex1.value)
        .subjectList
        .elementAt(selectedIndex2.value)
        .booksList
        .removeAt(oldIndex);

    dashboardList
        .elementAt(selectedIndex1.value)
        .subjectList
        .elementAt(selectedIndex2.value)
        .booksList
        .insert(newIndex, element);

    subjectList
        .assignAll(dashboardList.elementAt(selectedIndex1.value).subjectList);

    bookList.assignAll(subjectList.elementAt(selectedIndex2.value).booksList);

    Hive.box("user").put('classList', dashboardList);
    Hive.box('user').put('thirdScroll', secondScroll.offset);
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
    dashboardList.assignAll(Hive.box("user")
        .get('classList', defaultValue: classList)
        .cast<Class>());

    if (dashboardList.length < classList.length) {
      dashboardList.addAll(classList.sublist(dashboardList.length));
      Hive.box("user").put('classList', dashboardList);
    }

    final index = classList.indexWhere((element) =>
        element.classNumber.compareTo(
            dashboardList.elementAt(selectedIndex1.value).classNumber) ==
        0);

    if (dashboardList.elementAt(selectedIndex1.value).subjectList.length <
        classList.elementAt(index).subjectList.length) {
      dashboardList.elementAt(selectedIndex1.value).subjectList.addAll(classList
          .elementAt(index)
          .subjectList
          .sublist(dashboardList
              .elementAt(selectedIndex1.value)
              .subjectList
              .length));
      Hive.box("user").put('classList', dashboardList);
    }

    // if (kReleaseMode) {
    //   _createBottomBannerAd();
    // }

    final index1 = classList.elementAt(index).subjectList.indexWhere(
        (element) =>
            element.subject.compareTo(dashboardList
                .elementAt(selectedIndex1.value)
                .subjectList
                .elementAt(selectedIndex2.value)
                .subject) ==
            0);
    if (dashboardList
            .elementAt(selectedIndex1.value)
            .subjectList
            .elementAt(selectedIndex2.value)
            .booksList
            .length <
        classList
            .elementAt(index)
            .subjectList
            .elementAt(index1)
            .booksList
            .length) {
      dashboardList
          .elementAt(selectedIndex1.value)
          .subjectList
          .elementAt(selectedIndex2.value)
          .booksList
          .addAll(classList
              .elementAt(index)
              .subjectList
              .elementAt(index1)
              .booksList
              .sublist(bookList.length));

      Hive.box("user").put('classList', dashboardList);
    }

    subjectList
        .assignAll(dashboardList.elementAt(selectedIndex1.value).subjectList);

    bookList.assignAll(subjectList.elementAt(selectedIndex2.value).booksList);

    isLoading.value = false;
    super.onInit();
  }
}
