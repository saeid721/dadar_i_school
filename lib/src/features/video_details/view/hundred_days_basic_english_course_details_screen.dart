import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/download/controller/download_controller.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/service/auth/controller/auth_controller.dart';
import 'package:share_plus/share_plus.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../domain/server/http_client/app_config.dart';
import '../../../global/constants/images.dart';
import '../../../global/utils/show_toast.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_text.dart';
import '../../../initializer.dart';
import '../../../service/auth/view/auth_screen.dart';
import '../../account/controller/account_controller.dart';
import '../../account/view/subscribe_now_screen.dart';
import '../../home/view/widget/video_player_widget.dart';
import '../../my_account/controller/my_account_controller.dart';
import '../controller/video_details_controller.dart';
import 'widget/video_player_details_widget.dart';

class HundredDaysBasicEnglishCourseVideoDetailsScreen extends StatefulWidget {
  final String slug;
  const HundredDaysBasicEnglishCourseVideoDetailsScreen({super.key, required this.slug});
  @override
  State<HundredDaysBasicEnglishCourseVideoDetailsScreen> createState() => _HundredDaysBasicEnglishCourseVideoDetailsScreenState();
}

class _HundredDaysBasicEnglishCourseVideoDetailsScreenState extends State<HundredDaysBasicEnglishCourseVideoDetailsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();
  String? localVideoSrc;
  String? localInitImgSrc;
  String? localVideoName;

  @override
  void initState() {
    super.initState();
    final videoDetailsController = VideoDetailsController.current;
    final myAccountController = MyAccountController.current;

    final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await videoDetailsController.getMovieVideoDetails(slug: widget.slug);

      if (accessToken != null) {
        myAccountController.getSubscribersMe(isVideoAccess: true);
      }
    });

    videoDetailsController.movieVideoDetailsModel = null;
    myAccountController.subscriberMeModel = null;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  List<int> starList = [
    3,
    2,
    5,
    4,
    1,
  ];

  // Helper method to build the subscription message
  Widget _buildSubscriptionMessage(BuildContext context) {
    return Center(
      child: Container(
        height: 210,
        width: size(context).width,
        decoration: const BoxDecoration(color: ColorRes.black),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 5,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorRes.grey,
                    size: 18,
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlobalText(
                  str: "Oops! This video is part of our premium collection. Subscribe now to enjoy it for the duration of your subscription!",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return GetBuilder<DownloadController>(builder: (downloadController) {
        return GetBuilder<AccountController>(builder: (accountController) {
          return GetBuilder<VideoDetailsController>(builder: (videoDetailsController) {
            final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
            final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);
            final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);
            log("Current Lang Code: $langCode");

            final movieVideoDetailsData = videoDetailsController.movieVideoDetailsModel?.data;
            final dubbedList = movieVideoDetailsData?.dubbed?.where((dubbed) => dubbed.language?.code.toString() == langCode).toList();

            final checkWatchList = (videoDetailsController.watchListModel?.data?.isNotEmpty == true && videoDetailsController.watchListModel!.data!.any((watch) => watch.movieId == movieVideoDetailsData?.id));

            return Scaffold(
              key: scaffoldKey,
              body: GlobalContainer(
                height: size(context).height,
                width: size(context).width,
                color: ColorRes.appBackColor,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll) {
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sizedBoxH(27),

                        // ==# Video Player
                        dubbedList != null && dubbedList.isNotEmpty
                            ? ListView.builder(
                                itemCount: dubbedList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemBuilder: (ctx, index) {
                                  final dubbedVideo = dubbedList[index];
                                  log("Video Access Data: ${movieVideoDetailsData?.videoAccess}");
                                  log("Subscription Access Granted: ${accountController.subscriptionVideoAccessModel?.data?.accessGranted}");
                                  final isCorrectLanguage = dubbedVideo.language?.code == langCode;

                                  if (!isCorrectLanguage) {
                                    return const SizedBox.shrink();
                                  }

                                  final isVideoAccessible = movieVideoDetailsData?.videoAccess ?? false;
                                  final isAccessGranted = accountController.subscriptionVideoAccessModel?.data?.accessGranted ?? false;
                                  final videoSrc = dubbedVideo.video ?? "";
                                  final thumbnail = movieVideoDetailsData?.thumbnail ?? "";

                                  localInitImgSrc = thumbnail;
                                  localVideoName = movieVideoDetailsData?.title;

                                  // videoSrcData = videoSrc;

                                  // Check access token, video access, and subscription access
                                  if (accessToken == null) {
                                    if (isVideoAccessible) {
                                      return _buildSubscriptionMessage(context);
                                    } else {
                                      return VideoPlayerDetailsWidget(
                                        videoSrc: videoSrc,
                                        initImg: thumbnail,
                                        videoText: movieVideoDetailsData?.title ?? "",
                                      );
                                    }
                                  } else if (!isVideoAccessible || isAccessGranted) {
                                    return VideoPlayerDetailsWidget(
                                      videoSrc: videoSrc,
                                      initImg: thumbnail,
                                      videoText: movieVideoDetailsData?.title ?? "",
                                    );
                                  } else {
                                    return _buildSubscriptionMessage(context);
                                  }
                                },
                              )
                            : const SizedBox.shrink(),

                        sizedBoxH(10),
                        Container(
                            width: size(context).width,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GlobalText(
                                              str: movieVideoDetailsData?.title ?? "",
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            sizedBoxH(3),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: starList.asMap().entries.map((item) {
                                                    final imdbRating = videoDetailsController.movieVideoDetailsModel?.data?.imdbRating ?? 0;
                                                    return Icon(
                                                      Icons.star,
                                                      color: item.key < imdbRating ? ColorRes.appRedColor : ColorRes.grey,
                                                      size: 12,
                                                    );
                                                  }).toList(),
                                                ),
                                                sizedBoxW(5),
                                                GlobalText(
                                                  str: double.tryParse(videoDetailsController.movieVideoDetailsModel?.data?.imdbRating.toString() ?? '0').toString(),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                            sizedBoxH(3),
                                            SizedBox(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: videoDetailsController.movieVideoDetailsModel?.data?.genres?.asMap().entries.map((genre) {
                                                          return Padding(
                                                            padding: EdgeInsets.only(left: genre.key > 0 ? 5 : 0),
                                                            child: Row(
                                                              children: [
                                                                genre.key > 0
                                                                    ? Container(
                                                                        height: 5,
                                                                        width: 5,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ColorRes.white),
                                                                      )
                                                                    : const SizedBox.shrink(),
                                                                genre.key > 0 ? sizedBoxW(5) : const SizedBox.shrink(),
                                                                GlobalText(
                                                                  str: genre.value.name ?? "",
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }).toList() ??
                                                        [],
                                                  ),
                                                  sizedBoxW(3),
                                                  const Flexible(
                                                    child: GlobalText(
                                                      str: '|',
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  sizedBoxW(3),
                                                  Flexible(
                                                    child: GlobalText(
                                                      str: videoDetailsController.movieVideoDetailsModel?.data?.duration ?? '',
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            sizedBoxW(3),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: videoDetailsController.movieVideoDetailsModel?.data?.tags?.asMap().entries.map((tags) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(left: tags.key > 0 ? 5 : 0),
                                                      child: GlobalText(
                                                        str: tags.value.name ?? "",
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    );
                                                  }).toList() ??
                                                  [],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    sizedBoxW(10),
                                    GlobalButtonWidget(
                                      str: "Download",
                                      height: 30,
                                      width: 70,
                                      buttomColor: ColorRes.appRedColor,
                                      textSize: 11,
                                      onTap: () {
                                        accessToken == null
                                            ? showDialog(
                                                context: context,
                                                builder: (ctx) {
                                                  return const AuthScreen();
                                                })
                                            : movieVideoDetailsData?.videoAccess == true
                                                ? accountController.subscriptionVideoAccessModel?.data?.accessGranted == true
                                                    ? downloadController.downloadAndSaveVideo(
                                                        localMovieVideoModel: LocalMovieVideoModel(
                                                          videoSrc: localVideoSrc ?? "",
                                                          initImg: localInitImgSrc ?? "",
                                                          videoName: localVideoName ?? "",
                                                        ),
                                                      )
                                                    : Get.to(() => const SubscribeNowScreen())
                                                : downloadController.downloadAndSaveVideo(
                                                    localMovieVideoModel: LocalMovieVideoModel(
                                                      videoSrc: localVideoSrc ?? "",
                                                      initImg: localInitImgSrc ?? "",
                                                      videoName: localVideoName ?? "",
                                                    ),
                                                  );
                                      },
                                    )
                                  ],
                                ),
                                sizedBoxH(5),
                                SizedBox(
                                  child: ExpandableDescription(
                                    description: movieVideoDetailsData?.description ?? "",
                                    maxLines: 3,
                                  ),
                                ),
                                sizedBoxH(10),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            final trailerList = movieVideoDetailsData?.trailers?.where((trailer) => trailer.language?.code.toString() == langCode).toList();

                                            if (trailerList != null && trailerList.isNotEmpty) {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ListView.builder(
                                                          itemCount: trailerList.length,
                                                          physics: const NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemBuilder: (ctx, index) {
                                                            final trailer = trailerList[index];
                                                            log("Video Url: ${AppConfig.base.url}${trailer.url}");
                                                            localVideoSrc = trailer.url;
                                                            return VideoPlayerWidget(
                                                              videoSrc: "${AppConfig.base.url}${trailer.url}",
                                                              initImg: movieVideoDetailsData?.thumbnail ?? "",
                                                              close: true,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            } else {
                                              showCustomSnackBar("No trailer available in the selected language.", icon: Icons.info);
                                            }
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: GlobalImageLoader(imagePath: Images.playBuIc, height: 25, width: 25, color: ColorRes.appRedColor),
                                                ),
                                                GlobalText(
                                                  str: "Trailer",
                                                  fontSize: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (subscribersId != null) {
                                              videoDetailsController.reqWatchList(subscriberId: subscribersId, movieId: movieVideoDetailsData?.id.toString());
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return const AuthScreen();
                                                  });
                                            }
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: GlobalImageLoader(
                                                    imagePath: checkWatchList && subscribersId != null ? Images.checkIc : Images.addIc,
                                                    height: 20,
                                                    width: 20,
                                                    color: ColorRes.white,
                                                  ),
                                                ),
                                                const GlobalText(
                                                  str: "Watchlist",
                                                  fontSize: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (movieVideoDetailsData?.slug != null) {
                                              final movieLink = "https://ott-nebula.vercel.app/$langCode/movie/${movieVideoDetailsData?.slug}";
                                              final movieName = movieVideoDetailsData?.title ?? "";

                                              try {
                                                // Share the movie link using share_plus
                                                Share.share('$movieName\n\n$movieLink', subject: 'Watch $movieName on Nebula OTT');

                                                log('Movie Link: $movieName\n\n$movieLink');
                                              } catch (e, s) {
                                                log("Error: ", error: e, stackTrace: s);
                                              }
                                            } else {
                                              showCustomSnackBar("Unable to share the movie link", icon: Icons.error);
                                            }
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: GlobalImageLoader(imagePath: Images.shareDetailsIc, height: 20, width: 20, color: ColorRes.white),
                                                ),
                                                GlobalText(
                                                  str: "Share",
                                                  fontSize: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),

                        if (downloadController.progress > 0 && downloadController.progress < 100)
                          LinearProgressIndicator(
                            value: downloadController.progress / 100,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),

                        sizedBoxH(100),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
      });
    });
  }
}
