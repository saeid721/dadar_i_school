import 'dart:convert';
import 'dart:developer';
import '../../../domain/server/http_client/response_wrapper.dart';
import '../../../domain/server/http_client/api_helper.dart';
import 'package:flutter/services.dart' as root_bundle;
import '../model/beginner_spoken_english_model.dart';
import '../model/english_grammar_course_model.dart';
import '../model/hundred_days_basic_english_model.dart';
import '../model/hundred_days_spoken_english_model.dart';
import '../model/spoken_english_practice_model.dart';

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

  /// * Beginner Spoken English Model * //
  Future<BeginnerSpokenEnglishModel?> getBeginnerSpokenEnglishList() async {
    // final response = await requestHandler.get("");
    try {
      //* ==@ Load the JSON file from assets
      final String response = await root_bundle.rootBundle.loadString('assets/json/beginner_spoken_english_response.json');
      //* ==@ Parse the JSON
      final Map<String, dynamic> addressDemoResponse = json.decode(response);

      //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
      ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
      if (resWrap.status == 200) {
        return BeginnerSpokenEnglishModel.fromJson(resWrap.data ?? {});
      }
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }

  /// * Hundred Days Spoken English Model * //
  Future<HundredDaysSpokenEnglishModel?> getHundredDaysSpokenEnglishList() async {
    // final response = await requestHandler.get("");
    try {
      //* ==@ Load the JSON file from assets
      final String response = await root_bundle.rootBundle.loadString('assets/json/hundred_days_spoken_english_response.json');
      //* ==@ Parse the JSON
      final Map<String, dynamic> addressDemoResponse = json.decode(response);

      //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
      ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
      if (resWrap.status == 200) {
        return HundredDaysSpokenEnglishModel.fromJson(resWrap.data ?? {});
      }
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }

  /// * Spoken English Practice Model * //
  Future<SpokenEnglishPracticeModel?> getSpokenEnglishPracticeList() async {
    // final response = await requestHandler.get("");
    try {
      //* ==@ Load the JSON file from assets
      final String response = await root_bundle.rootBundle.loadString('assets/json/spoken_english_practice_response.json');
      //* ==@ Parse the JSON
      final Map<String, dynamic> addressDemoResponse = json.decode(response);

      //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
      ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
      if (resWrap.status == 200) {
        return SpokenEnglishPracticeModel.fromJson(resWrap.data ?? {});
      }
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }

  /// * English Grammar Course Model * //
  Future<EnglishGrammarCourseModel?> getEnglishGrammarCourseList() async {
    // final response = await requestHandler.get("");
    try {
      //* ==@ Load the JSON file from assets
      final String response = await root_bundle.rootBundle.loadString('assets/json/english_grammar_course_response.json');
      //* ==@ Parse the JSON
      final Map<String, dynamic> addressDemoResponse = json.decode(response);

      //* ==@ Create a ResponseWrapper instance (assuming you have a ResponseWrapper model)
      ResponseWrapper resWrap = ResponseWrapper.fromJson(addressDemoResponse);
      if (resWrap.status == 200) {
        return EnglishGrammarCourseModel.fromJson(resWrap.data ?? {});
      }
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }
}
