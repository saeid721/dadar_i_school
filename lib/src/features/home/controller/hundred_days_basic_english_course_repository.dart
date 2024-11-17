// import 'dart:convert';
// import 'dart:developer';
// import 'package:dadar_i_school/src/domain/server/http_client/api_helper.dart';
// import 'package:dadar_i_school/src/domain/server/http_client/response_wrapper.dart';
// import 'package:flutter/services.dart' as rootBundle;
//
// import '../model/hundred_days_basic_english_model.dart';
//
// class HundredDaysBasicEnglishCourseRepo extends ApiHelper {
//
//   /// * HundredDaysBasicEnglishCourseModel * //
//   Future<HundredDaysBasicEnglishCourseModel?> getHundredDaysBasicEnglishCourseData() async {
//     // final response = await requestHandler.get("");
//     try {
//       //* ==@ Load the JSON file from assets
//       final String response = await rootBundle.rootBundle.loadString('assets/json/hundred_days_basic_english_response.json');
//       //* ==@ Parse the JSON
//       final Map<String, dynamic> addressDemoResponse = json.decode(response);
//
//       //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
//       ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
//       if (resWrap.status == 200) {
//         return HundredDaysBasicEnglishCourseModel.fromJson(resWrap.data ?? {});
//       }
//     } catch (e) {
//       log("Error loading address data: $e");
//     }
//     return null;
//   }
//
// }
