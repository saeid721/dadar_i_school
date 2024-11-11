
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/create_watch_list_model.dart';
import '../model/movie_video_details_model.dart';
import '../model/series_video_details_model.dart';
import '../model/watch_list_model.dart';

class VideoDetailsRepository extends ApiHelper {

  Future<MovieVideoDetailsModel> getMovieVideoDetails({
    required String slug
  }) async {
    return MovieVideoDetailsModel.fromJson(await requestHandler.get("/movies/$slug/client"));
  }

  Future<SeriesVideoDetailsModel> getSeriesVideoDetails({
    required String slug
  }) async {
    return SeriesVideoDetailsModel.fromJson(await requestHandler.get("/series/$slug/client"));
  }

  Future<CreateWatchListModel> reqWatchList({
    required String? subscriberId,
    required String? movieId,
  }) async {

    Map<String, dynamic> params = {};
    params['subscriber_id'] = subscriberId;
    params['movie_id'] = movieId;

    final response = await requestHandler.post(AppConfig.createWatchListUrl.url, params);

    return CreateWatchListModel.fromJson(response);
  }

  Future<WatchListModel> getWatchList({
    required String? subscriberId
  }) async {
    Map<String, dynamic> params = {};
    params['subscriber_id'] = subscriberId;

    return WatchListModel.fromJson(await requestHandler.get(AppConfig.watchListUrl.url, queryParams: params));
  }

}
