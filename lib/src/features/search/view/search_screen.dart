//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
// import 'package:dadar_i_school/src/global/constants/images.dart';
// import 'package:dadar_i_school/src/global/widget/global_container.dart';
// import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
// import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
// import 'package:dadar_i_school/src/global/widget/global_text.dart';
// import '../../../domain/local/preferences/local_storage.dart';
// import '../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../global/widget/global_textform_field.dart';
// import '../../../initializer.dart';
// import '../../../service/empty_data/empty_data_widget.dart';
// import '../../../service/language_check/language_check.dart';
// import '../../video_details/view/movie_video_details_screen.dart';
// import '../../video_details/view/series_video_details_screen.dart';
// import '../controller/search_bar_controller.dart';
// import 'shimmer/search_list_shimmer.dart';
// import 'widget/search_menu_widget.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key,});
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final ScrollController scrollController = ScrollController();
//   TextEditingController searchCon = TextEditingController();
//   int currentPage = 1;
//   int pageSize = 20;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final searchBarController = SearchBarController.current;
//     searchBarController.getSearchPopular(limit: '30');
//
//   }
//
//   void scrollListener(){
//     if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
//       setState(() {
//         currentPage++;
//         pageSize = 2 * currentPage;
//       });
//       final searchBarController = SearchBarController.current;
//       searchBarController.getSearchList(limit: '$pageSize', page: '1', order: 'desc', search: searchCon.text.trim());
//     }
//   }
//
//   Widget _buildSearchResult({
//     required SearchBarController searchBarController,
//     required String langCode,
//   }) {
//     final isSearchActive = searchCon.text.isNotEmpty;
//     final searchResults = searchBarController.searchModel?.data?.result;
//     final popularResults = searchBarController.searchPopularModel?.data;
//
//     // If search is active, check if there are search results
//     if (isSearchActive) {
//       if (searchResults != null && searchResults.isNotEmpty) {
//         return _buildListView(searchResults, langCode);
//       } else {
//         return const EmptyDataWidget();
//       }
//     }
//
//     // If search is not active, show popular search results
//     if (popularResults != null && popularResults.isNotEmpty) {
//       return _buildListView(popularResults, langCode);
//     }
//
//     return const EmptyDataWidget();
//   }
//
//   Widget _buildListView(List<dynamic> data, String langCode) {
//     return ListView.builder(
//       itemCount: data.length,
//       padding: const EdgeInsets.only(bottom: 100),
//       shrinkWrap: true,
//       itemBuilder: (ctx, index) {
//         final result = data[index];
//         return SearchMenuWidget(
//           img: "${result?.thumbnail}",
//           text: LanguageCheck.checkLanguage(
//             langCode: langCode,
//             enText: result?.title ?? "",
//             bnText: result?.titleBn ?? "",
//             hiText: result?.titleHi ?? "",
//             arText: result?.titleAr ?? "",
//           ),
//           timeText: result?.duration ?? "",
//           viewText: result?.views.toString() ?? "",
//           onTap: () {
//             if(result.type == "movie"){
//               // Get.to(()=> MovieVideoDetailsScreen(
//               //   slug: result?.id ?? "",
//               // ));
//             } else if(result.type == "series"){
//               // Get.to(()=> SeriesVideoDetailsScreen(
//               //   slug: result?.id ?? "",
//               // ));
//             }
//           },
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//     return GetBuilder<SearchBarController>(builder: (searchBarController){
//       return Scaffold(
//         key: scaffoldKey,
//         body: GlobalContainer(
//           height: size(context).height,
//           width: size(context).width,
//           color: ColorRes.appBackColor,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               sizedBoxH(40),
//               const Padding(
//                 padding: EdgeInsets.only(left: 5),
//                 child: GlobalText(
//                   str: "Search",
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               sizedBoxH(10),
//               GlobalTextFormField(
//                 controller: searchCon,
//                 hintText: "Search Movie & Series",
//                 filled: true,
//                 fillColor: ColorRes.bottomColor,
//                 isDense: true,
//                 prefixIcon: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   child: GlobalImageLoader(
//                     imagePath: Images.searchIc,
//                     color: ColorRes.white200,
//                     height: 20,
//                     width: 20,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 sufixIcon: searchCon.text.isNotEmpty ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                   child: GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         searchCon.clear();
//                       });
//                     },
//                     child: const GlobalImageLoader(
//                       imagePath: Images.close,
//                       color: ColorRes.white200,
//                       height: 20,
//                       width: 20,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ) : const SizedBox.shrink(),
//                 onChanged: (val) async{
//                   setState(() {
//                     searchCon.text = val;
//                   });
//                   await searchBarController.getSearchList(limit: '$pageSize', page: '$currentPage', order: 'desc', search: val);
//                 },
//               ),
//
//               sizedBoxH(10),
//               Expanded(
//                 child: searchBarController.searchPopularModel?.data != null
//                     ? _buildSearchResult(searchBarController: searchBarController, langCode: langCode.toString())
//                     : searchListShimmer(["", "", "", "", "", "", ""])
//               )
//
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
