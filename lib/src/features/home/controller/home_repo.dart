
import '../model/hundred_days_basic_english_course_model.dart';
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/footer_model/footer_company_model.dart';
import '../model/footer_model/footer_explore_model.dart';
import '../model/footer_model/footer_popular_movies_model.dart';
import '../model/footer_model/footer_popular_series_model.dart';
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

class HomeRepository extends ApiHelper {

  //
  // Future<HundredDaysBasicEnglishCourseModel> getHundredDaysBasicEnglishCourseList() async {
  //   return HundredDaysBasicEnglishCourseModel.fromJson(await requestHandler.get(AppConfig.hundredDaysBasicEnglishUrl.url));
  // }







  Future<HomeSlidersModel> getHomeSliderList() async {
    return HomeSlidersModel.fromJson(await requestHandler.get(AppConfig.hundredDaysBasicEnglishUrl.url));
  }

  Future<HomeSectionModel> getHomeSections() async {
    return HomeSectionModel.fromJson(await requestHandler.get(AppConfig.homeSectionUrl.url));
  }

  Future<HomeSectionRecentModel> getHomeSectionRecent({
    required String limit,
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['section_id'] = sectionId;

    return HomeSectionRecentModel.fromJson(await requestHandler.get(AppConfig.homeSectionRecentUrl.url, queryParams: params));
  }

  Future<HomeSectionGenresModel> getHomeSectionGenres({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    return HomeSectionGenresModel.fromJson( await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params));
  }

  Future<HomeSectionGenresSeeAllModel> getHomeSectionGenresSeeAll({
    required String genreId,
    required String limit,
    required String page,
  }) async {
    Map<String, dynamic> params = {};
    params['genreId'] = genreId;
    params['limit'] = limit;
    params['page'] = page;

    return HomeSectionGenresSeeAllModel.fromJson(await requestHandler.get(AppConfig.homeSectionGenresSeeAllUrl.url, queryParams: params));
  }

  Future<HomeSectionUpComingModel> getHomeSectionUpComing({
    required String limit
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    return HomeSectionUpComingModel.fromJson(await requestHandler.get(AppConfig.homeSectionUpComingUrl.url, queryParams: params));
  }

  Future<HomeSectionAllMovieModel> getHomeSectionAllMovie({
    required String limit,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;

    return HomeSectionAllMovieModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllMovieUrl.url, queryParams: params));
  }

  Future<HomeSectionAllMovieSeeAllModel> getHomeSectionAllMovieSeeAll({
    required String limit,
    required String order,
    required String page,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;

    return HomeSectionAllMovieSeeAllModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllMovieSeeAllUrl.url, queryParams: params));
  }

  Future<HomeSectionAllSeriesModel> getHomeSectionAllSeries({
    required String limit,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    return HomeSectionAllSeriesModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllSeriesUrl.url, queryParams: params));
  }

  Future<HomeSectionAllSeriesSeeAllModel> getHomeSectionAllSeriesSeeAll({
    required String limit,
    required String order,
    required String page,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;

    return HomeSectionAllSeriesSeeAllModel.fromJson(await requestHandler.get(AppConfig.homeSectionAllSeriesSeeAllUrl.url, queryParams: params));
  }

  Future<HomeSectionTopMovieModel> getHomeSectionTopMovie({
    required String limit,
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['section_id'] = sectionId;

    return HomeSectionTopMovieModel.fromJson(await requestHandler.get(AppConfig.homeSectionTopMovieUrl.url, queryParams: params));
  }

  Future<HomeSectionTopSeriesModel> getHomeSectionTopSeries({
    required String limit,
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['section_id'] = sectionId;

    return HomeSectionTopSeriesModel.fromJson(await requestHandler.get(AppConfig.homeSectionTopSeriesUrl.url, queryParams: params));
  }

  Future<HomeSectionSelectedMovieModel> getHomeSectionSelectMovie({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    final response = await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params);

    return HomeSectionSelectedMovieModel.fromJson(response);
  }

  Future<HomeSectionSelectedSeriesModel> getHomeSectionSelectSeries({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    final response = await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params);

    return HomeSectionSelectedSeriesModel.fromJson(response);
  }

  Future<HomeSectionPosterSliderMovieModel> getHomeSectionPosterSliderMovie({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    final response = await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params);

    return HomeSectionPosterSliderMovieModel.fromJson(response);
  }

  Future<HomeSectionPosterSliderSeriesModel> getHomeSectionPosterSliderSeries({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    final response = await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params);

    return HomeSectionPosterSliderSeriesModel.fromJson(response);
  }

  Future<HomeSectionApplicationFeaturesModel> getHomeSectionApplicationFeatures() async {
    return HomeSectionApplicationFeaturesModel.fromJson(await requestHandler.get(AppConfig.homeSectionApplicationFeaturesUrl.url));
  }

  Future<HomeSectionFavoriteModel> getHomeSectionFavorite({
    required String sectionId
  }) async {
    Map<String, dynamic> params = {};
    params['section_id'] = sectionId;

    final response = await requestHandler.get(AppConfig.homeSectionGenresUrl.url, queryParams: params);

    return HomeSectionFavoriteModel.fromJson(response);
  }

  Future<HomeSectionBlogsModel> getHomeSectionBlogs({
    required String limit,
    required String order,
    required String page,
  }) async {

    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;

    final response = await requestHandler.get(AppConfig.homeSectionBlogsUrl.url, queryParams: params);

    return HomeSectionBlogsModel.fromJson(response);
  }

  Future<HomeSectionSingleBlogsModel> getHomeSectionSingleBlogs({
    required String blogId,
  }) async {

    final response = await requestHandler.get("/blogs/$blogId/client");

    return HomeSectionSingleBlogsModel.fromJson(response);
  }

  Future<FooterExploreModel> getFooterExplore() async {
    return FooterExploreModel.fromJson(await requestHandler.get(AppConfig.footerExploreUrl.url));
  }
  Future<FooterPopularSeriesModel> getFooterPopularSeries() async {
    return FooterPopularSeriesModel.fromJson(await requestHandler.get(AppConfig.footerPopularSeriesUrl.url));
  }
  Future<FooterPopularMoviesModel> getFooterPopularMovies() async {
    return FooterPopularMoviesModel.fromJson(await requestHandler.get(AppConfig.footerPopularMoviesUrl.url));
  }
  Future<FooterCompanyModel> getFooterCompany() async {
    return FooterCompanyModel.fromJson(await requestHandler.get(AppConfig.footerCompanyUrl.url));
  }

  Future<HomeSectionAllGenresModel> getHomeSectionAllGenres({
    required String limit,
    required String genreId,
    required String page,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['genreId'] = genreId;
    params['page'] = page;

    return HomeSectionAllGenresModel.fromJson(await requestHandler.get(AppConfig.HomeSectionAllGenresUrl.url, queryParams: params));
  }

}
