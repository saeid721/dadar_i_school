import 'package:dadar_i_school/src/features/account/model/subscriber/subscriber_list_model.dart';
import 'package:dadar_i_school/src/features/account/model/subscriber/subscriber_model.dart';
import 'package:dadar_i_school/src/features/account/model/subscriber/subscriber_pagination_model.dart';
import 'package:dadar_i_school/src/features/account/model/subscription_plan/all_subscription_model.dart';
import 'package:dadar_i_school/src/features/account/model/subscription_plan/subscription_plan_list_model.dart';
import 'package:dadar_i_school/src/features/account/model/watch_history_model.dart';
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/Subscription/subscription_enroll_me_model.dart';
import '../model/language_model.dart';
import '../model/subscription_plan/all_subscription_pagination_model.dart';
import '../model/subscription_plan/subscription_model.dart';

class AccountRepository extends ApiHelper {
  Future<LanguageModel> getLanguageList() async {
    return LanguageModel.fromJson(await requestHandler.get(AppConfig.languageListUrl.url));
  }

  Future<WatchHistoryModel> getWatchHistory() async {
    return WatchHistoryModel.fromJson(await requestHandler.get(AppConfig.watchHistoryUrl.url));
  }

  Future<SubscriptionModel> getSubscription() async {
    return SubscriptionModel.fromJson(await requestHandler.get(AppConfig.subscriptionUrl.url));
  }

  Future<AllSubscriptionModel> getAllSubscription() async {
    return AllSubscriptionModel.fromJson(await requestHandler.get(AppConfig.allSubscriptionUrl.url));
  }

  Future<AllSubscriptionPaginationModel> getAllSubscriptionPagination() async {
    return AllSubscriptionPaginationModel.fromJson(await requestHandler.get(AppConfig.allSubscriptionPaginationUrl.url));
  }

  Future<SubscriptionPlanListModel> getSubscriptionPlanList() async {
    return SubscriptionPlanListModel.fromJson(await requestHandler.get(AppConfig.subscriptionPlanListUrl.url));
  }

  Future<SubscriberListModel> getSubscriberList() async {
    return SubscriberListModel.fromJson(await requestHandler.get(AppConfig.subscriberListUrl.url));
  }

  Future<SubscriberPaginationModel> getSubscriberPagination() async {
    return SubscriberPaginationModel.fromJson(await requestHandler.get(AppConfig.subscriberPaginationUrl.url));
  }

  Future<SubscriberModel> getSubscriber() async {
    return SubscriberModel.fromJson(await requestHandler.get(AppConfig.subscriberUrl.url));
  }

  Future<SubscriptionEnrollMeModel> reqSubscriptionEnroll({
    required String? planId,
  }) async {
    Map<String, dynamic> params = {};
    params['plan_id'] = planId;

    final response = await requestHandler.post(AppConfig.subscriptionEnrollMeUrl.url, params);
    return SubscriptionEnrollMeModel.fromJson(response);
  }
}
