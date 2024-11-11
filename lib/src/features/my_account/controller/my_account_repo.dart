
import '../../../domain/server/http_client/api_helper.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../model/subscribers_me_model.dart';
import '../model/update_subscribers_me_model.dart';

class MyAccountRepository extends ApiHelper {

  Future<SubscriberMeModel> getSubscribersMe() async {
    return SubscriberMeModel.fromJson(await requestHandler.get(AppConfig.subscribersMeUrl.url));
  }

  Future<UpdateSubscriberMeModel> updateSubscribersMe({
    required String? firstName,
    required String? lastName,
    required String? email,
    required String? phone,
    required String? address,
  }) async {
    Map<String, dynamic> params = {};
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['email'] = email;
    params['phone'] = phone;
    params['address'] = address;

    final response = await requestHandler.put(AppConfig.subscribersMeUrl.url, params);
    return UpdateSubscriberMeModel.fromJson(response);
  }

}
