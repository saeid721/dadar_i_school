
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/account/model/watch_history_model.dart';
import '../model/Subscription/subscription_enroll_me_model.dart';
import '../model/language_model.dart';
import '../model/Subscription/subscription_plan_list_model.dart';
import '../model/subscription/subscription_list_model.dart';
import '../model/subscription/subscription_video_access_model.dart';
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

  // =@ Subscription Enroll Me Model
  SubscriptionEnrollMeModel? subscriptionEnrollMeModel;
  Future postSubscriptionEnroll({
    required int? planId,
    required Function() onChange,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqSubscriptionEnroll(
        planId: planId,
      );

      subscriptionEnrollMeModel = response;
      onChange();

      _isLoading = false;
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Subscription List Model
  SubscriptionListModel? subscriptionListModel;
  Future getSubscriptionList() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscriptionList();
      subscriptionListModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

  // =@ Subscription Video Access Model
  SubscriptionVideoAccessModel? subscriptionVideoAccessModel;
  Future getSubscriptionVideoAccess({
    required int? planId,
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscriptionVideoAccess(planId: planId);
      subscriptionVideoAccessModel = response;

      _isLoading = false;
      update();
    } catch(e, s) {
      log('Error: ', error: e, stackTrace: s);
      _isLoading = false;
      _hasError = true;
      update();
    }
  }

}
