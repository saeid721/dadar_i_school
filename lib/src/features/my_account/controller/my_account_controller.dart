
import 'dart:developer';
import 'package:get/get.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../initializer.dart';
import '../../video_details/controller/video_details_controller.dart';
import '../model/subscribers_me_model.dart';
import '../model/update_subscribers_me_model.dart';
import 'my_account_repo.dart';

class MyAccountController extends GetxController implements GetxService {
  static MyAccountController get current => Get.find();
  final MyAccountRepository repository = MyAccountRepository();
  final videoDetailsController = VideoDetailsController.current;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  // =/@ User Profile Method
  SubscriberMeModel? subscriberMeModel;

  Future getSubscribersMe() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.getSubscribersMe();
      if(response.code == 200){
        subscriberMeModel = response;
        locator<LocalStorage>().setString(key: StorageKeys.subscribersId, value: subscriberMeModel?.data?.id.toString() ?? '');
      }

      final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);

      log("Subscribers Id Log: $subscribersId");
      if(subscribersId != null){
        videoDetailsController.getWatchList(subscriberId: subscribersId);
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

  // =/@ Registration Method
  UpdateSubscriberMeModel? updateSubscriberMeModel;

  Future updateSubscribersMe({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? phone,
    required String? address,
    required void Function() stateChange
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.updateSubscribersMe(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          address: address
      );

      if(response.code == 200){
        updateSubscriberMeModel = response;
        getSubscribersMe();
        stateChange();
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
