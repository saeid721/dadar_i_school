//
// import 'dart:developer';
// import 'package:get/get.dart';
// import '../model/search_list_model.dart';
// import '../model/search_popular_model.dart';
// import 'search_bar_repo.dart';
//
// class SearchBarController extends GetxController implements GetxService {
//   static SearchBarController get current => Get.find();
//   final SearchBarRepository repository = SearchBarRepository();
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   bool _hasError = false;
//   bool get hasError => _hasError;
//
//   // =/@ SearchModel
//   SearchListModel? searchModel;
//   Future getSearchList({
//     required String limit,
//     required String order,
//     required String page,
//     required String search
//   }) async {
//     try {
//       _isLoading = true;
//       _hasError = false;
//       update();
//
//       final response =  await repository.getSearchList(
//           limit: limit,
//           order: order,
//           page: page,
//           search: search
//       );
//
//       searchModel = response;
//
//       _isLoading = false;
//       update();
//     } catch (e,s) {
//       log('Error: ', error: e, stackTrace: s);
//       _isLoading = false;
//       _hasError = true;
//       update();
//     }
//   }
//
//   // =/@ Search Popular Model
//   SearchPopularModel? searchPopularModel;
//
//   Future getSearchPopular({
//     required String limit,
//   }) async {
//     try {
//       _isLoading = true;
//       _hasError = false;
//       update();
//
//       final response = await repository.getSearchPopular(limit: limit);
//       searchPopularModel = response;
//
//       _isLoading = false;
//       update();
//     } catch (e, s) {
//       log('Error: ', error: e, stackTrace: s);
//       _isLoading = false;
//       _hasError = true;
//       update();
//     }
//   }
//
//
// }