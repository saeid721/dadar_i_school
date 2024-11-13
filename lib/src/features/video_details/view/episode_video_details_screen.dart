//
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../../domain/local/preferences/local_storage.dart';
// import '../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../global/constants/colors_resources.dart';
// import '../../../global/constants/images.dart';
// import '../../../global/utils/show_toast.dart';
// import '../../../global/widget/global_bottom_widget.dart';
// import '../../../global/widget/global_container.dart';
// import '../../../global/widget/global_image_loader.dart';
// import '../../../global/widget/global_sized_box.dart';
// import '../../../global/widget/global_text.dart';
// import '../../../initializer.dart';
// import '../../../service/auth/controller/auth_controller.dart';
// import '../../../service/auth/view/auth_screen.dart';
// import '../../../service/language_check/language_check.dart';
// import '../../account/controller/account_controller.dart';
// import '../../account/view/subscribe_now_screen.dart';
// import '../../my_account/controller/my_account_controller.dart';
// import '../controller/video_details_controller.dart';
// import '../model/series_video_details_model.dart';
// import 'widget/video_player_details_widget.dart';
//
// class EpisodeVideoDetailsScreen extends StatefulWidget {
//   final SeasonDetailsEpisodes episode;
//   final String initImg;
//   const EpisodeVideoDetailsScreen({
//     super.key,
//     required this.episode,
//     required this.initImg
//   });
//   @override
//   State<EpisodeVideoDetailsScreen> createState() => _MovieVideoDetailsScreenState();
// }
//
// class _MovieVideoDetailsScreenState extends State<EpisodeVideoDetailsScreen> {
//
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController emailCon = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     final myAccountController = MyAccountController.current;
//
//     final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
//
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//
//       if(accessToken != null){
//         myAccountController.getSubscribersMe(isVideoAccess: true);
//       }
//     });
//
//
//     myAccountController.subscriberMeModel = null;
//     // Reset to portrait mode when exiting full-screen
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitUp,
//     ]);
//   }
//
//   List<int> starList = [3, 2, 5, 4, 1,];
//
//   // Helper method to build the subscription message
//   Widget _buildSubscriptionMessage(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 210,
//         width: size(context).width,
//         decoration: const BoxDecoration(color: ColorRes.black),
//         child: Stack(
//           children: [
//             Positioned(
//               top: 8,
//               left: 5,
//               child: GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Container(
//                   height: 30,
//                   width: 30,
//                   color: Colors.transparent,
//                   child: const Icon(
//                     Icons.arrow_back_ios_new_outlined,
//                     color: ColorRes.grey,
//                     size: 18,
//                   ),
//                 ),
//               ),
//             ),
//             const Center(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: GlobalText(
//                   str: "Oops! This video is part of our premium collection. Subscribe now to enjoy it for the duration of your subscription!",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 12,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(builder: (authController){
//       return GetBuilder<AccountController>(builder: (accountController){
//         return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
//           final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//           final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);
//           final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
//           log("Current Lang Code: $langCode");
//
//           final seriesVideoDetailsData = videoDetailsController.seriesVideoDetailsModel?.data;
//           final dubbedList = widget.episode.dubbed?.where((dubbed) => dubbed.language?.code.toString() == langCode).toList();
//
//           final checkWatchList = (videoDetailsController.watchListModel?.data?.isNotEmpty == true &&
//               videoDetailsController.watchListModel!.data!.any((watch) => watch.episodeId == widget.episode.id));
//
//           return Scaffold(
//             key: scaffoldKey,
//             body: GlobalContainer(
//               height: size(context).height,
//               width: size(context).width,
//               color: ColorRes.appBackColor,
//               child: NotificationListener<OverscrollIndicatorNotification>(
//                 onNotification: (overScroll){
//                   overScroll.disallowIndicator();
//                   return true;
//                 },
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       sizedBoxH(27),
//
//                       // ==# Video Player
//                       dubbedList != null && dubbedList.isNotEmpty ?
//                       ListView.builder(
//                         itemCount: dubbedList.length,
//                         physics: const NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         itemBuilder: (ctx, index) {
//                           final dubbedVideo = dubbedList[index];
//                           log("Video Access Data: ${widget.episode.videoAccess}");
//                           log("Subscription Access Granted: ${accountController.subscriptionVideoAccessModel?.data?.accessGranted}");
//                           final isCorrectLanguage = dubbedVideo.language?.code == langCode;
//
//                           if (!isCorrectLanguage) {
//                             return const SizedBox.shrink();
//                           }
//
//                           final isVideoAccessible = widget.episode.videoAccess ?? false;
//                           final isAccessGranted = accountController.subscriptionVideoAccessModel?.data?.accessGranted ?? false;
//                           final videoSrc = dubbedVideo.video ?? "";
//                           final thumbnail = widget.episode.thumbnail ?? "";
//
//                           // Check access token, video access, and subscription access
//                           if (accessToken == null) {
//                             if (isVideoAccessible) {
//                               return _buildSubscriptionMessage(context);
//                             } else {
//                               return VideoPlayerDetailsWidget(
//                                 videoSrc: videoSrc,
//                                 initImg: thumbnail,
//                                 videoText: LanguageCheck.checkLanguage(
//                                   langCode: langCode,
//                                   enText: widget.episode.title ?? "",
//                                   bnText: widget.episode.titleBn ?? "",
//                                   hiText: widget.episode.titleHi ?? "",
//                                   arText: widget.episode.titleAr ?? "",
//                                 ),
//                               );
//                             }
//                           } else if (!isVideoAccessible || isAccessGranted) {
//                             return VideoPlayerDetailsWidget(
//                               videoSrc: videoSrc,
//                               initImg: thumbnail,
//                               videoText: LanguageCheck.checkLanguage(
//                                 langCode: langCode,
//                                 enText: widget.episode.title ?? "",
//                                 bnText: widget.episode.titleBn ?? "",
//                                 hiText: widget.episode.titleHi ?? "",
//                                 arText: widget.episode.titleAr ?? "",
//                               ),
//                             );
//                           } else {
//                             return _buildSubscriptionMessage(context);
//                           }
//                         },
//                       ) : const SizedBox.shrink(),
//
//                       sizedBoxH(10),
//                       Container(
//                           width: size(context).width,
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: SizedBox(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           GlobalText(
//                                             str: LanguageCheck.checkLanguage(
//                                               langCode: langCode,
//                                               enText: widget.episode.title ?? "",
//                                               bnText: widget.episode.titleBn ?? "",
//                                               hiText: widget.episode.titleHi ?? "",
//                                               arText: widget.episode.titleAr ?? "",
//                                             ),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//
//                                           sizedBoxH(3),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: starList.asMap().entries.map((item){
//                                                   final imdbRating = widget.episode.imdbRating ?? 0;
//                                                   return Icon(
//                                                     Icons.star,
//                                                     color: item.key < imdbRating ? ColorRes.appRedColor : ColorRes.grey,
//                                                     size: 12,
//                                                   );
//                                                 }).toList(),
//                                               ),
//                                               sizedBoxW(5),
//                                               GlobalText(
//                                                 str: double.tryParse(widget.episode.imdbRating.toString()).toString(),
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ],
//                                           ),
//
//                                           sizedBoxH(3),
//                                           SizedBox(
//                                             child: Row(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               children: [
//
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   children: seriesVideoDetailsData?.genres?.asMap().entries.map((genre){
//                                                     return Padding(
//                                                       padding: EdgeInsets.only(left: genre.key > 0 ? 5 : 0),
//                                                       child: Row(
//                                                         children: [
//                                                           genre.key > 0 ?
//                                                           Container(
//                                                             height: 5,
//                                                             width: 5,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius: BorderRadius.circular(100),
//                                                                 color: ColorRes.white
//                                                             ),
//                                                           ) : const SizedBox.shrink(),
//                                                           genre.key > 0 ? sizedBoxW(5) : const SizedBox.shrink(),
//                                                           GlobalText(
//                                                             str: LanguageCheck.checkLanguage(
//                                                               langCode: langCode,
//                                                               enText: genre.value.name ?? "",
//                                                               bnText: genre.value.nameBn ?? "",
//                                                               hiText: genre.value.nameHi ?? "",
//                                                               arText: genre.value.nameAr ?? "",
//                                                             ),
//                                                             fontSize: 12,
//                                                             fontWeight: FontWeight.w500,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     );
//                                                   }).toList() ?? [],
//                                                 ),
//
//                                                 sizedBoxW(3),
//                                                 const Flexible(
//                                                   child: GlobalText(
//                                                     str: '|',
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//
//                                                 sizedBoxW(3),
//                                                 Flexible(
//                                                   child: GlobalText(
//                                                     str: widget.episode.duration ?? '',
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//
//                                               ],
//                                             ),
//                                           ),
//                                           sizedBoxW(3),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: seriesVideoDetailsData?.tags?.asMap().entries.map((tags){
//                                               return Padding(
//                                                 padding: EdgeInsets.only(left: tags.key > 0 ? 5 : 0),
//                                                 child: GlobalText(
//                                                   str: LanguageCheck.checkLanguage(
//                                                     langCode: langCode,
//                                                     enText: tags.value.name ?? "",
//                                                     bnText: tags.value.nameBn ?? "",
//                                                     hiText: tags.value.nameHi ?? "",
//                                                     arText: tags.value.nameAr ?? "",
//                                                   ),
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               );
//                                             }).toList() ?? [],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//
//                                   sizedBoxW(10),
//
//                                   GlobalButtonWidget(
//                                     str: accessToken == null
//                                         ? "LogIn"
//                                         : widget.episode.videoAccess == true
//                                         ? accountController.subscriptionVideoAccessModel?.data?.accessGranted == true
//                                         ? "Download"
//                                         : "Subscribe"
//                                         : "Download",
//                                     height: 30,
//                                     width: 70,
//                                     buttomColor: ColorRes.appRedColor,
//                                     textSize: 11,
//                                     onTap: (){
//                                       accessToken == null
//                                           ? showDialog(
//                                           context: context,
//                                           builder: (ctx){
//                                             return const AuthScreen();
//                                           })
//                                           : widget.episode.videoAccess == true
//                                           ? accountController.subscriptionVideoAccessModel?.data?.accessGranted == true
//                                           ? showCustomSnackBar("Download Working Process.. 1")
//                                           : Get.to(()=> const SubscribeNowScreen())
//                                           : showCustomSnackBar("Download Working Process.. 2");
//                                     },
//                                   )
//                                 ],
//                               ),
//
//                               sizedBoxH(5),
//                               SizedBox(
//                                 child: ExpandableDescription(
//                                   description: LanguageCheck.checkLanguage(
//                                     langCode: langCode,
//                                     enText: widget.episode.description ?? "",
//                                     bnText: widget.episode.descriptionBn ?? "",
//                                     hiText: widget.episode.descriptionHi ?? "",
//                                     arText: widget.episode.descriptionAr ?? "",
//                                   ),
//                                   maxLines: 3,
//                                 ),
//                               ),
//
//                               sizedBoxH(10),
//                               SizedBox(
//                                 height: 50,
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       child: GestureDetector(
//                                         onTap: () async{
//                                           if(subscribersId != null){
//                                             videoDetailsController.reqWatchList(
//                                                 subscriberId: subscribersId,
//                                                 episodeId: widget.episode.id.toString()
//                                             );
//                                           } else{
//                                             showDialog(
//                                                 context: context,
//                                                 builder: (ctx){
//                                                   return const AuthScreen();
//                                                 });
//                                           }
//
//                                         },
//                                         child: Container(
//                                           color: Colors.transparent,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: GlobalImageLoader(
//                                                   imagePath: checkWatchList && subscribersId != null
//                                                       ? Images.checkIc
//                                                       : Images.addIc,
//                                                   height: 20,
//                                                   width: 20,
//                                                   color: ColorRes.white,
//                                                 ),
//                                               ),
//                                               const GlobalText(
//                                                 str: "Watchlist",
//                                                 fontSize: 12,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: GestureDetector(
//                                         onTap: (){
//                                           if(seriesVideoDetailsData?.slug != null){
//                                             final movieLink = "https://ott-nebula.vercel.app/$langCode/series/${seriesVideoDetailsData?.slug}";
//                                             final movieName = seriesVideoDetailsData?.title ?? "";
//
//                                             try{
//                                               // Share the movie link using share_plus
//                                               Share.share('$movieName\n\n$movieLink',
//                                                   subject: 'Watch $movieName on Nebula OTT'
//                                               );
//
//
//                                               log('Movie Link: $movieName\n\n$movieLink');
//                                             } catch(e, s){
//                                               log("Error: ", error: e, stackTrace: s);
//                                             }
//
//                                           }  else {
//                                             showCustomSnackBar("Unable to share the movie link", icon: Icons.error);
//                                           }
//                                         },
//                                         child: Container(
//                                           color: Colors.transparent,
//                                           child: const Column(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Expanded(
//                                                 child: GlobalImageLoader(
//                                                     imagePath: Images.shareDetailsIc,
//                                                     height: 20,
//                                                     width: 20,
//                                                     color: ColorRes.white
//                                                 ),
//                                               ),
//                                               GlobalText(
//                                                 str: "Share",
//                                                 fontSize: 12,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//
//                             ],
//                           )
//                       ),
//
//                       // /// =============@/ Season & Episode /@ =================
//                       // sizedBoxH(15),
//                       // const SeriesDetailsSeriesMenuScreen(),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//       });
//     });
//   }
// }
