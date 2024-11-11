
import 'package:dadar_i_school/src/global/method/get_device_info.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../../../initializer.dart';
import '../model/log_out_model.dart';
import '../model/login_model.dart';
import '../model/registration_model.dart';

class AuthRepository extends ApiHelper {

  Future<LogInModel> reqLogIn({
    required String email,
    required String password
  }) async {
    final currentAddress = locator<LocalStorage>().getString(key: StorageKeys.currentAddress);

    locator<LocalStorage>().setString(key: StorageKeys.deviceId, value: GetDeviceInfo.deviceID);
    locator<LocalStorage>().setString(key: StorageKeys.deviceName, value: GetDeviceInfo.deviceName);
    locator<LocalStorage>().setString(key: StorageKeys.deviceOs, value: GetDeviceInfo.deviceOS);
    locator<LocalStorage>().setString(key: StorageKeys.ipAddress, value: GetDeviceInfo.ipAddress);

    Map<String, dynamic> params = {};
    params['phone'] = email;
    params['password'] = password;
    params['device_id'] = GetDeviceInfo.deviceID;
    params['device_name'] = GetDeviceInfo.deviceName;
    params['device_type'] = GetDeviceInfo.deviceOS;
    params['ip_address'] = GetDeviceInfo.ipAddress;
    params['location'] = currentAddress;

    final response = await requestHandler.post(AppConfig.logInUrl.url, params);
    requestHandler.updateHeader(token: response['data']['token']['access']);
    return LogInModel.fromJson(response);
  }

  Future<RegistrationModel> reqRegistration({
    required String? phone,
    required String? password,
  }) async {
    Map<String, dynamic> params = {};
    params['phone'] = phone;
    params['password'] = password;

    final response = await requestHandler.post(AppConfig.registrationUrl.url, params);
    return RegistrationModel.fromJson(response);
  }

  Future<LogOutModel> reqLogOut() async {
    final deviceId = locator<LocalStorage>().getString(key: StorageKeys.deviceId);

    Map<String, dynamic> params = {};
    params['device_id'] = deviceId;

    final response = await requestHandler.post(AppConfig.logOutUrl.url, params);
    return LogOutModel.fromJson(response);
  }

}
