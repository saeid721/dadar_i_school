
import 'dart:developer';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage_keys.dart';
import 'package:dadar_i_school/src/features/account/controller/account_controller.dart';
import 'package:dadar_i_school/src/features/video_details/controller/video_details_controller.dart';
import '../../../features/dashboard_bottom_navigation_bar/dashboard_bottom_navigation_bar.dart';
import '../../../features/my_account/controller/my_account_controller.dart';
import '../../../initializer.dart';
import '../model/log_out_model.dart';
import '../model/login_model.dart';
import '../model/registration_model.dart';
import 'auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  static AuthController get current => Get.find();
  final AuthRepository repository = AuthRepository();
  final myAccountController = MyAccountController.current;
  //final videoDetailsController = VideoDetailsController.current;
  final accountController = AccountController.current;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  bool isLoginScreen = true;

  void toggleScreen() {
    isLoginScreen = !isLoginScreen;
    update();
  }

  // =/@ LogIn Method
  LogInModel? logInModel;

  Future reqLogIn({
    required String email,
    required String password,
    required void Function() stateChange
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqLogIn(email: email, password: password);

      if(response.code == 200){
        logInModel = response;
        locator<LocalStorage>().setString(key: StorageKeys.accessToken, value: logInModel?.data?.token?.access.toString() ?? '');
        locator<LocalStorage>().setString(key: StorageKeys.refreshToken, value: logInModel?.data?.token?.refresh.toString() ?? '');

        stateChange();
      }

      final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

      log("Access Token: $accessToken");

      myAccountController.getSubscribersMe(isVideoAccess: true);
      // if(accessToken != null){
      //   myAccountController.getSubscribersMe();
      // }

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
  RegistrationModel? registrationModel;

  Future reqRegistration({
    required String? phone,
    required String? password,
    required void Function() stateChange
  }) async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqRegistration(
        phone: phone,
        password: password
      );

      if(response.code == 201){
        registrationModel = response;
        isLoginScreen = false;
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

  // =/@ LogOut Method
  LogOutModel? logOutModel;

  Future reqLogOut() async {
    try {
      _isLoading = true;
      _hasError = false;
      update();

      final response = await repository.reqLogOut();

      if(response.code == 200){
        logOutModel = response;
        final String? token = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
        log("===/@ User Token: $token");
        accountController.subscriptionVideoAccessModel = null;

        await locator<LocalStorage>().clearLocalStorage()?.whenComplete((){
          Get.offAll(()=> const DashboardBottomNavigationBar());
        });
        log("===/@ User Token: $token");

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
