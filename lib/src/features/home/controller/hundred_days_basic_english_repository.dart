import 'dart:convert';
import 'dart:developer';
import '../../../domain/server/http_client/response_wrapper.dart';
import '../../../domain/server/http_client/api_helper.dart';
import 'package:flutter/services.dart' as root_bundle;
import '../model/hundred_days_basic_english_model.dart';

class HomeRepository extends ApiHelper {
  /// * Hundred Days Basic English Model * //
  Future<HundredDaysBasicEnglishModel?> getHundredDaysBasicEnglishList() async {
    // final response = await requestHandler.get("");
    try {
      //* ==@ Load the JSON file from assets
      final String response = await root_bundle.rootBundle.loadString('assets/json/hundred_days_basic_english_response.json');
      //* ==@ Parse the JSON
      final Map<String, dynamic> addressDemoResponse = json.decode(response);

      //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
      ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
      if (resWrap.status == 200) {
        return HundredDaysBasicEnglishModel.fromJson(resWrap.data ?? {});
      }
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }
}
