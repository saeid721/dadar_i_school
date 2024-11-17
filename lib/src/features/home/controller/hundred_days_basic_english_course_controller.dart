// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../model/hundred_days_basic_english_model.dart';
// import '../model/section_data_model.dart';
// import 'hundred_days_basic_english_course_repository.dart';
//
// class HundredDaysBasicEnglishCourseController extends GetxController implements GetxService {
//   static HundredDaysBasicEnglishCourseController get current => Get.find();
//   final HundredDaysBasicEnglishCourseRepo repository = HundredDaysBasicEnglishCourseRepo();
//
//   /// * HundredDaysBasicEnglishCourseModel * //
//   HundredDaysBasicEnglishCourseModel? hundredDaysBasicEnglishCourseModel;
//   Future getHundredDaysBasicEnglishCourseData() async {
//     try {
//       final res = await repository.getHundredDaysBasicEnglishCourseData();
//
//       if (res != null) {
//         hundredDaysBasicEnglishCourseModel = res;
//         update();
//       }
//     } on Exception catch (e) {
//       log(e.toString());
//     }
//   }
//
// }
