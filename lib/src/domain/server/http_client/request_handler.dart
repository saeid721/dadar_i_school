import 'dart:convert';
import 'dart:developer' show log;
import 'package:get/get.dart' hide Response hide FormData;
import 'package:dio/dio.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage.dart';
import '../../../global/utils/show_toast.dart';
import '../../../initializer.dart';
import '../../local/preferences/local_storage_keys.dart';
import 'api_check.dart';
import 'app_config.dart';

class RequestHandler extends GetxController {
  RequestHandler({
    required Dio dio,
  })  : _dio = dio;

  final mainUrl = AppConfig.base.url;

  final Dio _dio;
  Dio get dio => _dio;

  void _initialize() {
    final currentToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
    final langCodeId = locator<LocalStorage>().getString(key: StorageKeys.langCodeId);
    final langCodeName = locator<LocalStorage>().getString(key: StorageKeys.langCodeName);
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    locator<LocalStorage>().setString(key: StorageKeys.langCodeId, value: langCodeId ?? '1');
    locator<LocalStorage>().setString(key: StorageKeys.langCodeName, value: langCodeName ?? 'English');
    locator<LocalStorage>().setString(key: StorageKeys.langCode, value: langCode ?? 'en');

    log("Current Lang Code Data1: $langCode");

    if (currentToken != null) {
      log("==/@ Access Token: $currentToken");
      _updateDioHeaders(token: currentToken);
    } else{
      log("Token Not Found!! $currentToken");
    }
  }

  void _updateDioHeaders({required String token}) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Connection'] = 'keep-alive';
  }

  Future<void> updateHeader({required String token}) async {
    locator<LocalStorage>().setString(key: StorageKeys.accessToken, value: token);

    final currentToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

    log("#UpdatedHeader: \$TOKEN => $currentToken");
    _updateDioHeaders(token: currentToken.toString());
  }

  // updateHeader({required String token}) async {
  //   locator<MyPrefs>().settString(key: PrefsKeys.userToken, value: token);
  //   final currentToken = locator<MyPrefs>().gettString(key: PrefsKeys.userToken);
  //
  //   log("#UpdatedHeader: \$TOKEN => $currentToken");
  //   dio.options.headers['Authorization'] = 'Bearer $currentToken';
  //   dio.options.headers['Connection'] = 'keep-alive';
  // }

  Future<Map<String, dynamic>> post(
      String url,
      dynamic params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    printTest(" =======/@ Start @/======= ");

    try {
      log("==/@ Url: ${mainUrl + url}");
      log('==/@ Params: $params');
      log('==/@ Headers: ${dio.options.headers.toString()}');

      final response = await dio.post(
          baseUrl ?? mainUrl + url,
          data: params,
          queryParameters: queryParams,
          options: options
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      // Check if the response data is a string and parse it if necessary
      final Map<String, dynamic> responseData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      ApiCheckerDec.checkApi(responseData['code'], responseData['message']);
      return responseData;
    } on DioException catch (error, stackTrace) {
      final responseData = error.response?.data is String
          ? jsonDecode(error.response?.data)
          : error.response?.data;

      throw RequestException(
          method: "/POST",
          url: baseUrl ?? mainUrl + url,
          statusCode: responseData['code'],
          message: responseData['message'],
          data: params,
          error: error,
          trace: stackTrace,
          res: error.response,
          errorMsg: error.message
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/POST",
        url: baseUrl ?? mainUrl + url,
        message: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }

  Future put(
      String url,
      dynamic params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    _initialize();
    printTest(" =======/@ Start @/======= ");

    try {
      log("==/@ Url: ${mainUrl + url}");
      log('==/@ Params: $params');
      log('==/@ Headers: ${dio.options.headers.toString()}');

      final formData = FormData.fromMap(params);

      log('Request Data1: ${jsonEncode(params)}');

      final response = await dio.put(
        baseUrl ?? mainUrl + url,
        data: formData,
        queryParameters: queryParams,
        options: options,
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      // Check if the response data is a string and parse it if necessary
      final Map<String, dynamic> responseData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      ApiCheckerDec.checkApi(responseData['code'], responseData['message']);

      return responseData;
    } on DioException catch (error, stackTrace) {
      final responseData = error.response?.data is String
          ? jsonDecode(error.response?.data)
          : error.response?.data;

      throw RequestException(
        method: "/PUT-1",
        url: baseUrl ?? mainUrl + url,
        statusCode: responseData['code'],
        message: responseData['message'],
        data: params,
        error: error,
        trace: stackTrace,
        res: error.response,
        errorMsg: error.message,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/PUT-2",
        url: baseUrl ?? mainUrl + url,
        message: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }


  Future<Map<String, dynamic>> get(
      String url, {
        dynamic params,
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    _initialize();

    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode) ?? 'en';

    queryParams = queryParams ?? {};

    if (!queryParams.containsKey('lang')) {
      queryParams['lang'] = langCode;
    }

    try {
      // log("==/@ Url: ${mainUrl + url}");
      // log('==/@ Params: $params');
      // log('==/@ Headers: ${dio.options.headers.toString()}');

      final response = await dio.get(
        baseUrl ?? mainUrl + url,
        data: params,
        options: options,
        queryParameters: queryParams,
      );

      final Map<String, dynamic> responseData = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      log("""
==/@
    Message: "Success.."
    Method: "#GET"
    Url: ${response.realUri}
    Params: $params
    Headers: ${dio.options.headers.toString()}
    StatusCode: ${response.statusCode}
    Response Data: ${response.data}
==/@
""");

      // ApiCheckerDec.checkApi(responseData['status'], responseData['message']);
      return responseData;
    } on DioException catch (error, stackTrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        error: error,
        message: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/GET",
        url: baseUrl ?? mainUrl + url,
        message: errorMsg,
        error: error,
        trace: stackTrace,
      );
    }
  }

  Future<Response> delete(
      String url,
      dynamic params, {
        String? errorMsg,
        String? baseUrl,
        Options? options,
        Map<String, dynamic>? queryParams,
      }) async {
    log(" =======/@ @ Start @/======= ");
    log("==/@ Url: ${mainUrl + url}");
    log(dio.options.headers.toString());

    final formData = FormData.fromMap(params);

    try {
      final response = await dio.delete(
          baseUrl ?? mainUrl + url,
          data: formData,
          queryParameters: queryParams,
          options: options
      );

      log('==/@ Response StatusCode: ${response.statusCode}');
      log('==/@ Response Data: ${response.data}');

      ApiChecker.checkApi(response);
      return response;
    } on DioException catch (error, stackTrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        data: params,
        error: error,
        message: errorMsg,
        trace: stackTrace,
        res: error.response,
        statusCode: error.response?.statusCode,
      );
    } catch (error, stackTrace) {
      throw RequestException(
        method: "/DELETE",
        url: baseUrl ?? mainUrl + url,
        message: errorMsg,
        data: params,
        error: error,
        trace: stackTrace,
      );
    }
  }

  // Future<Response> delete(
  //     String url,
  //     Map<String, dynamic> params, {
  //       bool tokenNeeded = true,
  //       String? errorMsg,
  //       String? baseUrl,
  //       Options? options,
  //       Map<String, dynamic>? queryParams,
  //     }) async {
  //   Response response;
  //   try {
  //     if (tokenNeeded && refreshToken) await attemptReLogin();
  //
  //     response = await dio.delete(
  //       baseUrl ?? mainUrl + url,
  //       data: params,
  //       queryParameters: queryParams,
  //       options: options,
  //     );
  //     return response;
  //   } on DioError catch (error, stracktrace) {
  //     throw RequestException(
  //       method: "/DELETE",
  //       url: baseUrl ?? mainUrl + url,
  //       data: params,
  //       error: error,
  //       msg: errorMsg,
  //       trace: stracktrace,
  //       res: error.response,
  //       statusCode: error.response?.statusCode,
  //     );
  //   } catch (error, stracktrace) {
  //     throw RequestException(
  //       method: "/DELETE",
  //       url: baseUrl ?? mainUrl + url,
  //       msg: errorMsg,
  //       data: params,
  //       error: error,
  //       trace: stracktrace,
  //     );
  //   }
  // }

}

class RequestException implements Exception {
  String method;
  String url;
  int? statusCode;
  String? message;
  Object error;
  Response? res;
  StackTrace trace;
  dynamic data;
  String? errorMsg;

  RequestException({
    required this.method,
    required this.url,
    this.statusCode,
    this.message,
    required this.error,
    this.res,
    this.data,
    required this.trace,
    this.errorMsg
  }) {
    ApiCheckerDec.checkApi(statusCode ?? 0, message.toString());

    printTest("==/@ Response Error:");
    log(
      """
==/@
    Method: "$method"
    Url: "$url
    StatusCode: $statusCode
    Message: $message
    Response: $res
    Data: ${data.toString()}
    ErrorMsg: "$errorMsg"
==/@
""",
      name: "#RequestException",
      time: DateTime.now(),
      error: error,
      stackTrace: trace,
    );
  }
}

