
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_company_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_explore_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_popular_movies_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_popular_series_model.dart';
import '../data/hundred_days_basic_english_course_data.dart';
import '../model/video_home_model.dart';
import '../model/hundred_days_basic_english_course_model.dart';
import '../model/home_section/home_section_all_genres_model.dart';
import '../model/home_section/home_section_all_movie_model.dart';
import '../model/home_section/home_section_all_movie_see_all_model.dart';
import '../model/home_section/home_section_all_series_model.dart';
import '../model/home_section/home_section_all_series_see_all_model.dart';
import '../model/home_section/home_section_application_features_model.dart';
import '../model/home_section/home_section_blogs_model.dart';
import '../model/home_section/home_section_favorite_model.dart';
import '../model/home_section/home_section_genres_model.dart';
import '../model/home_section/home_section_genres_see_all_model.dart';
import '../model/home_section/home_section_poster_slider_movie_model.dart';
import '../model/home_section/home_section_poster_slider_series_model.dart';
import '../model/home_section/home_section_recent_model.dart';
import '../model/home_section/home_section_selected_movie_model.dart';
import '../model/home_section/home_section_selected_series_model.dart';
import '../model/home_section/home_section_single_blogs_model.dart';
import '../model/home_section/home_section_top_movie_model.dart';
import '../model/home_section/home_section_top_series_model.dart';
import '../model/home_section_model.dart';
import '../model/home_slider_model.dart';
import '../model/home_section/home_section_up_coming_model.dart';
import 'home_repo.dart';

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

  initAddListener(){
    scrollController.addListener(scrollListener);
  }

  disposeListener(){
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

  List<SectionData> sections = [];

  @override
  void onInit() {
    super.onInit();
    loadLocalSections();
  }

  void loadLocalSections() {
    sections = [
      SectionData(id: "1", sectionType: "hundred_days_spoken_english", title: "100 Days Spoken English Practice"),
      SectionData(id: "2", sectionType: "hundred_days_basic_english", title: "100 Days Basic English Course"),
      SectionData(id: "3", sectionType: "beginner_spoken_english", title: "Beginner Spoken English"),
      SectionData(id: "4", sectionType: "spoken_english_practice", title: "Spoken English Practice"),
      SectionData(id: "5", sectionType: "english_grammar_course", title: "English Grammar Course"),
    ];
    update();
  }

  // =/@ BasicEnglishCourseModel
  HundredDaysBasicEnglishCourseModel? hundredDaysBasicEnglishCourseModel;
  List<HundredDaysBasicEnglishCourseData> hundredDaysBasicEnglishCourseData = [];
  void getHundredDaysBasicEnglishCourseList() {
    _isLoading = true;
    _hasError = false;
    update();

    try {
      // Loading the local static data
      hundredDaysBasicEnglishCourseData = hundredDaysBasicEnglishCourseData;
      //log('hundredDaysBasicEnglishCourseData');
      _isLoading = false;
      update();
    } catch (e, s) {
      _isLoading = false;
      _hasError = true;
      update();
    }
  }







  //
  // // =/@ BasicEnglishCourseModel
  // HundredDaysBasicEnglishCourseModel? hundredDaysBasicEnglishCourseModel;
  // List<HundredDaysBasicEnglishCourseData> hundredDaysBasicEnglishCourseData = [];
  // Future getHundredDaysBasicEnglishCourseList() async {
  //   try {
  //     _isLoading = true;
  //     _hasError = false;
  //     update();
  //
  //     final response = await repository.getHundredDaysBasicEnglishCourseList();
  //     hundredDaysBasicEnglishCourseModel = response;
  //
  //     _isLoading = false;
  //     update();
  //   } catch (e, s) {
  //     log('Error: ', error: e, stackTrace: s);
  //     _isLoading = false;
  //     _hasError = true;
  //     update();
  //   }
  // }




  // =/@ Home Section All Movie
  HomeSectionAllMovieModel? homeSectionAllMovieModel;
  HomeSectionAllMovieSeeAllModel? homeSectionAllMovieSeeAllModel;

  Future getHomeSectionAllMovie({
    required String limit
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionAllMovie(
          limit: limit
      );

      if(response.code == 200){
        homeSectionAllMovieModel = response;
      }

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  Future getHomeSectionAllMovieSeeAll({
    required String limit,
    required String order,
    required String page,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionAllMovieSeeAll(
          limit: limit,
          order: order,
          page: page
      );

      if(response.code == 200){
        homeSectionAllMovieSeeAllModel = response;
      }

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
