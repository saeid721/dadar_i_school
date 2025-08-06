
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class RequestHandler extends GetxController {
  RequestHandler({
    required Dio dio,
  })  : _dio = dio;

  final Dio _dio;
  Dio get dio => _dio;
}

