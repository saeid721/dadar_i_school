
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/account/model/subscriber/subscriber_list_model.dart';
import 'package:dadar_i_school/src/features/account/model/subscriber/subscriber_model.dart';
import 'package:dadar_i_school/src/features/account/model/watch_history_model.dart';
import '../model/Subscription/subscription_enroll_me_model.dart';
import '../model/language_model.dart';
import '../model/subscription_plan/all_subscription_model.dart';
import '../model/subscription_plan/all_subscription_pagination_model.dart';
import '../model/subscription_plan/subscription_model.dart';
import '../model/subscription_plan/subscription_plan_list_model.dart';
import 'account_repo.dart';

class AccountController extends GetxController implements GetxService {
  static AccountController get current => Get.find();
  final AccountRepository repository = AccountRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  // =/@ User Profile Method
  LanguageModel? languageModel;

  Future getLanguageList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getLanguageList();
      languageModel = response;

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Watch History Model
  WatchHistoryModel? watchHistoryModel;

  Future getWatchHistory() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getWatchHistory();
      watchHistoryModel = response;

      _isLoading = false;
      update();

    } catch(e, s){
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

// =@ Subscription Model
  SubscriptionModel? subscriptionModel;
  Future getSubscription() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscription();
      subscriptionModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ All Subscription Model
  AllSubscriptionModel? allSubscriptionsModel;
  Future getAllSubscriptions() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getAllSubscription();
      allSubscriptionsModel = response;

      _isLoading = false;
      update();

    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError =  true;
      update();
    }
  }

  // =@ All Subscription Pagination Model
  AllSubscriptionPaginationModel? allSubscriptionPaginationModel;
  Future getAllSubscriptionPagination() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getAllSubscriptionPagination();
      allSubscriptionPaginationModel = response;

      _isLoading = false;
      update();

    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError =  true;
      update();
    }
  }

// =@ Subscription Plan List Model
  SubscriptionPlanListModel? subscriptionsPlanListModel;
  Future getSubscriptionsPlanList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscriptionPlanList();
      subscriptionsPlanListModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Subscriber List Model
SubscriberListModel? subscriberListModel;
  Future getSubscriberList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response =  await repository.getSubscriberList();
      subscriberListModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Subscriber Model
SubscriberModel? subscriberModel;
  Future getSubscriber() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscriber();
      subscriberModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Subscription Enroll Me Model
  SubscriptionEnrollMeModel? subscriptionEnrollMeModel;
  Future postSubscriptionEnroll({
    required String? planId,
}) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqSubscriptionEnroll(
        planId: planId,
      );
      if (response.code == 201) {
        subscriptionEnrollMeModel = response;
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
