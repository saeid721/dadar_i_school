
import 'package:dadar_i_school/src/domain/server/http_client/api_helper.dart';
import 'package:dadar_i_school/src/domain/server/http_client/app_config.dart';
import 'package:dadar_i_school/src/features/tab/model/free_tab_view_see_all_model.dart';
import '../../home/model/home_section/home_section_all_movie_model.dart';
import '../../home/model/home_section/home_section_all_series_model.dart';
import '../model/free_tab_view_model.dart';
import '../model/genres_model.dart';
import '../model/movie_tab_view_industries_model.dart';

class TabViewRepository extends ApiHelper {

  Future<GenresListModel> getGenresList({
    required String type
  }) async {
    Map<String, dynamic> params = {};
    params['type'] = type;
    return GenresListModel.fromJson(await requestHandler.get(AppConfig.genresListUrl.url, queryParams: params));
  }

  Future<HomeSectionAllMovieModel> getMovieList({
    required String limit,
    required String order,
    required String page,
    required String? genreSlug,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;
    params['genre_slug'] = genreSlug;

    return HomeSectionAllMovieModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllMovieUrl.url, queryParams: params));
  }

  Future<HomeSectionAllSeriesModel> getSeriesTabList({
    required String limit,
    required String order,
    required String page,
    required String? genreSlug,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;
    params['genre_slug'] = genreSlug;

    return HomeSectionAllSeriesModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllSeriesUrl.url, queryParams: params));
  }

  Future<MovieTabViewIndustriesModel> getMovieTabViewIndustries() async {
    return MovieTabViewIndustriesModel.fromJson(await requestHandler.get(AppConfig.movieTabViewIndustriesUrl.url));
  }

  Future<FreeTabViewModel> getFreeTabView({
  required String limit
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    return FreeTabViewModel.fromJson(await requestHandler.get(AppConfig.freeTabViewUrl.url, queryParams: params));
  }

  Future<FreeTabViewSeeAllModel> getFreeTabViewSeeAll({
    required String limit,
    required String order,
    required String page,
    required String content,
}) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;
    params['content'] = content;

    return FreeTabViewSeeAllModel.fromJson(await requestHandler.get(AppConfig.freeTabViewSeeAllUrl.url, queryParams: params));
  }


}