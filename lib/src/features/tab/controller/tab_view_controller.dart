
import 'dart:developer';
import 'package:get/get.dart';
import '../../home/model/home_section/home_section_all_movie_see_all_model.dart';
import '../../home/model/home_section/home_section_all_series_see_all_model.dart';
import '../model/free_tab_view_model.dart';
import '../model/genres_model.dart';
import '../model/movie_tab_view_industries_model.dart';
import '../model/free_tab_view_see_all_model.dart';
import 'tab_view_repo.dart';

class TabViewController extends GetxController implements GetxService {
  static TabViewController get current => Get.find();
  final TabViewRepository repository = TabViewRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  List<String> shimmerList = ["", "", "", "", ""];

  // =/@ Genres Movie Series List
  GenresListModel? genresMovieListModel;
  GenresListModel? genresSeriesListModel;
  Future getGenresList({
    required String type
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getGenresList(
        type: type
      );

      if(type == "movie"){
        genresMovieListModel = response;
      } else{
        genresSeriesListModel = response;
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

  /// =========/@ Movie Tab @/============

  // =/@ Home Movie Tab List
  Map<String, HomeSectionAllMovieSeeAllModel?> movieTabListDataByGenre = {};
  Map<String, HomeSectionAllMovieSeeAllModel?> movieTabListDataByGenreSeeAll = {};

  Future getMovieTabList({
    required String limit,
    required String order,
    required String page,
    required String? genreSlug,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getMovieList(
          limit: limit,
          order: order,
          page: page,
          genreSlug: genreSlug
      );

      if(response.code == 200){
        if(sectionType == "see_all"){
          // Store thriller data by genreSlug
          movieTabListDataByGenre[genreSlug ?? ""] = response;
        } else{
          movieTabListDataByGenreSeeAll[genreSlug ?? ""] = response;
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

  // =/@ Home Series Tab List
  Map<String, HomeSectionAllSeriesSeeAllModel?> seriesTabListDataByGenre = {};
  Map<String, HomeSectionAllSeriesSeeAllModel?> seriesTabListDataByGenreSeeAll = {};

  Future getSeriesTabList({
    required String limit,
    required String order,
    required String page,
    required String? genreSlug,
    String? sectionType
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSeriesTabList(
          limit: limit,
          order: order,
          page: page,
          genreSlug: genreSlug
      );

      if(response.code == 200){
        if(sectionType == "see_all"){
          // Store thriller data by genreSlug
          seriesTabListDataByGenre[genreSlug ?? ""] = response;
        } else{
          seriesTabListDataByGenreSeeAll[genreSlug ?? ""] = response;
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

  // =/@ Movie Tab View Industries Model
  MovieTabViewIndustriesModel? movieTabViewIndustriesModel;
  Future getMovieTabViewIndustries() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getMovieTabViewIndustries();
      movieTabViewIndustriesModel = response;

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }


  // =/@ Free Tab View Model
  FreeTabViewModel? freeTabViewModel;
  Future getFreeTabView({
    required String limit
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getFreeTabView(
          limit: limit
      );
      freeTabViewModel = response;

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =/@ Free Tab View See All Model
  FreeTabViewSeeAllModel? freeTabViewSeeAllModel;

  Future getFreeTabViewSeeAll({
    required String limit,
    required String order,
    required String page,
    required String content
}) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response =  await repository.getFreeTabViewSeeAll(
          limit: limit,
          order: order,
          page: page,
          content: content
      );

      freeTabViewSeeAllModel = response;

      _isLoading = false;
      update();
    } catch (e,s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }


}