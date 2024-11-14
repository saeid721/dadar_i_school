
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_company_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_explore_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_popular_movies_model.dart';
import 'package:dadar_i_school/src/features/home/model/footer_model/footer_popular_series_model.dart';
import '../data/hundred_days_basic_english_course_data.dart';
import '../model/video_home_model.dart';
import '../model/video_model.dart';
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




  // =/@ Home Slider List
  HomeSlidersModel? homeSlidersModel;

  Future getHomeSliderList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSliderList();

      if(response.code == 200){
        homeSlidersModel = response;
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

  // =/@ Home Section
  HomeSectionModel? homeSectionModel;
  List<HomeSectionData>? homeSortedList = [];

  Future getHomeSections() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSections();

      if(response.code == 200){
        homeSectionModel = response;
        homeSortedList = homeSectionModel?.data;
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

  // =/@ Home Section Recent List
  HomeSectionRecentModel? homeSectionRecentModel;
  HomeSectionRecentModel? homeSectionRecentSeeAllModel;

  Future getHomeSectionRecent({
    required String limit,
    required String sectionId,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionRecent(
        limit: limit,
        sectionId: sectionId
      );

      if(response.code == 200){
        if(sectionType == "recent"){
          homeSectionRecentModel = response;
        } else{
          homeSectionRecentSeeAllModel = response;
        }
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

  // =/@ Home Section Genres List
  HomeSectionGenresModel? homeSectionGenresModel;

  Future getHomeSectionGenres({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionGenres(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionGenresModel = response;
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

  HomeSectionGenresSeeAllModel? homeSectionGenresSeeAllModel;
  Future getHomeSectionGenresSeeAll({
    required String genreId,
    required String limit,
    required String page
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionGenresSeeAll(
          genreId: genreId,
          limit: limit,
          page: page
      );

      if(response.code == 200){
        homeSectionGenresSeeAllModel = response;
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

  // =/@ Home Section UpComing
  HomeSectionUpComingModel? homeSectionUpComingModel;
  HomeSectionUpComingModel? homeSectionUpComingSeeAllModel;

  Future getHomeSectionUpComing({
    required String limit,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionUpComing(limit: limit);

      if(response.code == 200){
        if(sectionType == "upcoming"){
          homeSectionUpComingModel = response;
        } else{
          homeSectionUpComingSeeAllModel = response;
        }
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

  // =/@ Home Section All Series
  HomeSectionAllSeriesModel? homeSectionAllSeriesModel;
  HomeSectionAllSeriesSeeAllModel? homeSectionAllSeriesSeeAllModel;

  Future getHomeSectionAllSeries({
    required String limit,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionAllSeries(
          limit: limit,
      );

      if(response.code == 200){
        homeSectionAllSeriesModel = response;
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

  Future getHomeSectionAllSeriesSeeAll({
    required String limit,
    required String order,
    required String page,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionAllSeriesSeeAll(
          limit: limit,
          order: order,
          page: page
      );

      if(response.code == 200){
        homeSectionAllSeriesSeeAllModel = response;
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

  // =/@ Home Section Top Movie
  HomeSectionTopMovieModel? homeSectionTopMovieModel;
  HomeSectionTopMovieModel? homeSectionTopMovieSeeAllModel;

  Future getHomeSectionTopMovie({
    required String limit,
    required String sectionId,
    String? sectionType,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionTopMovie(
          limit: limit,
          sectionId: sectionId
      );

      if(response.code == 200){
        if(sectionType == "top_movies"){
          homeSectionTopMovieModel = response;
        } else{
          homeSectionTopMovieSeeAllModel = response;
        }
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

  // =/@ Home Section Top Series
  HomeSectionTopSeriesModel? homeSectionTopSeriesModel;
  HomeSectionTopSeriesModel? homeSectionTopSeriesSeeAllModel;

  Future getHomeSectionTopSeries({
    required String limit,
    required String sectionId,
    String? sectionType,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionTopSeries(
        limit: limit,
        sectionId: sectionId
      );

      if(response.code == 200){
        if(sectionType == "top_series"){
          homeSectionTopSeriesModel = response;
        } else{
          homeSectionTopSeriesSeeAllModel = response;
        }
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

  // =/@ Home Section Genres List
  HomeSectionSelectedMovieModel? homeSectionSelectedMovieModel;

  Future getHomeSectionSelectMovie({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionSelectMovie(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionSelectedMovieModel = response;
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

  // =/@ Home Section Genres List
  HomeSectionSelectedSeriesModel? homeSectionSelectedSeriesModel;

  Future getHomeSectionSelectSeries({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionSelectSeries(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionSelectedSeriesModel = response;
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

  // =/@ Home Section Genres List
  List<HomeSectionPosterSliderMovieData>? homeSectionPosterSliderMovieDataList = [];

  Future getHomeSectionPosterSliderMovie({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionPosterSliderMovie(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionPosterSliderMovieDataList = response.data;
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

  // =/@ Home Section Genres List
  List<HomeSectionPosterSliderSeriesData>? homeSectionPosterSliderSeriesDataList = [];

  Future getHomeSectionPosterSliderSeries({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionPosterSliderSeries(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionPosterSliderSeriesDataList = response.data;
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

  // =/@ Home Section Favorite List
  HomeSectionApplicationFeaturesModel? homeSectionApplicationFeaturesModel;

  Future getHomeSectionApplicationFeatures() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionApplicationFeatures();

      if(response.code == 200){
        homeSectionApplicationFeaturesModel = response;
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

  // =/@ Home Section Favorite List
  HomeSectionFavoriteModel? homeSectionFavoriteModel;

  Future getHomeSectionFavorite({
    required String sectionId
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionFavorite(
          sectionId: sectionId
      );

      if(response.code == 200){
        homeSectionFavoriteModel = response;
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

  // =/@ Home Section Favorite List
  HomeSectionBlogsModel? homeSectionBlogsModel;
  HomeSectionBlogsModel? homeSectionBlogsSeeAllModel;

  Future getHomeSectionBlogs({
    required String limit,
    required String order,
    required String page,
    String? sectionType,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionBlogs(
          limit: limit,
          order: order,
          page: page
      );

      if(response.code == 200){
        homeSectionBlogsModel = response;
        if(sectionType == "blogs"){
          homeSectionBlogsModel = response;
        } else{
          homeSectionBlogsSeeAllModel = response;
        }
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

  HomeSectionSingleBlogsModel? homeSectionSingleBlogsModel;

  Future getHomeSectionSingleBlogs({
    required String blogId,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionSingleBlogs(
          blogId: blogId
      );

      if(response.code == 200){
        homeSectionSingleBlogsModel = response;
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

  // =@ Footer Company Model
  FooterCompanyModel? footerCompanyModel;
  Future getFooterCompany() async {
    try {
      _isLoading = true;
      _hasError =  false;
      update();

      final response = await repository.getFooterCompany();
      footerCompanyModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Footer Explore Model
  FooterExploreModel? footerExploreModel;
  Future getFooterExplore() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getFooterExplore();
      footerExploreModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Footer Popular Movies Model
  FooterPopularMoviesModel? footerPopularMoviesModel;
  Future getFooterPopularMovies() async {
    try {
      _isLoading = true;
      _hasError =  false;
      update();

      final response = await repository.getFooterPopularMovies();
      footerPopularMoviesModel = response;

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Footer Popular Series Model
  FooterPopularSeriesModel? footerPopularSeriesModel;
  Future getFooterPopularSeries() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response =  await repository.getFooterPopularSeries();
      footerPopularSeriesModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
    }
  }

  // =/@ Home Section All Genres Model
  HomeSectionAllGenresModel? homeSectionAllGenresModel;

  Future getHomeSectionAllGenres({
    required String limit,
    required String genreId,
    required String page
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getHomeSectionAllGenres(
          limit: limit,
          genreId: genreId,
          page: page,
      );
      homeSectionAllGenresModel = response;


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
