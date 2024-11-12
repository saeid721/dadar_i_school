
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/search_list_model.dart';
import '../model/search_popular_model.dart';

class SearchBarRepository extends ApiHelper {

  Future<SearchListModel> getSearchList({
    required String limit,
    required String order,
    required String page,
    required String search,
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    params['order'] = order;
    params['page'] = page;
    params['search'] = search;

    return SearchListModel.fromJson(await requestHandler.get(AppConfig.searchUrl.url, queryParams: params));
  }

  Future<SearchPopularModel> getSearchPopular({
    required String limit
  }) async {
    Map<String, dynamic> params = {};
    params['limit'] = limit;
    return SearchPopularModel.fromJson(await requestHandler.get(AppConfig.searchPopularUrl.url, queryParams: params));
  }


}
