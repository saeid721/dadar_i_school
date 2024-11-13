
import 'package:dadar_i_school/src/features/account/model/Subscription/subscription_plan_list_model.dart';
import 'package:dadar_i_school/src/features/account/model/watch_history_model.dart';
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/Subscription/subscription_enroll_me_model.dart';
import '../model/language_model.dart';
import '../model/subscription/subscription_list_model.dart';
import '../model/subscription/subscription_video_access_model.dart';

class AccountRepository extends ApiHelper {

  // Future<LanguageModel> getLanguageList() async {
  //   return LanguageModel.fromJson(await requestHandler.get(AppConfig.languageListUrl.url));
  // }

  Future<WatchHistoryModel> getWatchHistory() async {
    return WatchHistoryModel.fromJson(await requestHandler.get(AppConfig.watchHistoryUrl.url));
  }

  Future<SubscriptionPlanListModel> getSubscriptionPlanList() async {
    return SubscriptionPlanListModel.fromJson(await requestHandler.get(AppConfig.subscriptionPlanListUrl.url));
  }

  Future<SubscriptionEnrollMeModel> reqSubscriptionEnroll({
    required int? planId,
  }) async {
    Map<String, dynamic> params = {};
    params['plan_id'] = planId;

    final response = await requestHandler.post(AppConfig.subscriptionEnrollMeUrl.url, params);
    return SubscriptionEnrollMeModel.fromJson(response);
  }

  Future<SubscriptionListModel> getSubscriptionList() async {
    return SubscriptionListModel.fromJson(await requestHandler.get(AppConfig.subscriptionEnrollMeUrl.url));
  }

  Future<SubscriptionVideoAccessModel> getSubscriptionVideoAccess({
    required int? planId,
  }) async {
    Map<String, dynamic> params = {};
    params['plan_id'] = planId;

    return SubscriptionVideoAccessModel.fromJson(await requestHandler.get(AppConfig.subscriptionVideoAccessUrl.url, params: params));
  }

}
