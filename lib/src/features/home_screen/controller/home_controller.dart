import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/beginner_spoken_english_model.dart';
import '../model/english_grammar_course_model.dart';
import '../model/hundred_days_basic_english_model.dart';
import '../model/home_section_data_model.dart';
import '../model/hundred_days_spoken_english_model.dart';
import '../model/spoken_english_practice_model.dart';
import 'home_repository.dart';

class HomePageController extends GetxController implements GetxService {
  static HomePageController get current => Get.find();
  final HomeRepository repository = HomeRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  List<String> shimmerList = ["", "", "", "", ""];

  // ==/@ Scroll
  bool isScrolled = false;
  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.offset > 0 && !isScrolled) {
      isScrolled = true;
    } else if (scrollController.offset <= 0 && isScrolled) {
      isScrolled = false;
    }
    update();
  }

  initAddListener() {
    scrollController.addListener(scrollListener);
  }

  disposeListener() {
    scrollController.dispose();
  }

  // ==/@ Tab Bar
  int tabBarIndex = -1;
  void tabBarClick(int index) {
    tabBarIndex = index;
    update();
  }

  void resetTabBarClick() {
    tabBarIndex = -1;
    update();
  }

  List<HomeSectionDataModel> homeSectionList = [];

  @override
  void onInit() {
    super.onInit();
    loadHomeSections();
  }

  void loadHomeSections() {
    homeSectionList = [
      HomeSectionDataModel(id: "1", sectionType: "hundred_days_basic_english", title: "100 Days Basic English Course"),
      HomeSectionDataModel(id: "2", sectionType: "beginner_spoken_english", title: "Beginner Spoken English"),
      HomeSectionDataModel(id: "3", sectionType: "hundred_days_spoken_english", title: "100 Days Spoken English Practice"),
      HomeSectionDataModel(id: "4", sectionType: "spoken_english_practice", title: "Spoken English Practice"),
      HomeSectionDataModel(id: "5", sectionType: "english_grammar_course", title: "English Grammar Course"),
    ];
    update();
  }

  /// * Hundred Days Basic English Model * //
  HundredDaysBasicEnglishModel? hundredDaysBasicEnglishModel;
  Future getHundredDaysBasicEnglishList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHundredDaysBasicEnglishList();

      hundredDaysBasicEnglishModel = response;
      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  /// * Beginner Spoken English Model * //
  BeginnerSpokenEnglishModel? beginnerSpokenEnglishModel;
  Future getBeginnerSpokenEnglishList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getBeginnerSpokenEnglishList();

      beginnerSpokenEnglishModel = response;
      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  /// * Hundred Days Spoken English Model * //
  HundredDaysSpokenEnglishModel? hundredDaysSpokenEnglishModel;
  Future getHundredDaysSpokenEnglishList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHundredDaysSpokenEnglishList();

      hundredDaysSpokenEnglishModel = response;
      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  /// * Spoken English Practice Model * //
  SpokenEnglishPracticeModel? spokenEnglishPracticeModel;
  Future getSpokenEnglishPracticeList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSpokenEnglishPracticeList();

      spokenEnglishPracticeModel = response;
      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  /// * English Grammar Course Model * //
  EnglishGrammarCourseModel? englishGrammarCourseModel;
  Future getEnglishGrammarCourseList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getEnglishGrammarCourseList();

      englishGrammarCourseModel = response;
      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }
}
