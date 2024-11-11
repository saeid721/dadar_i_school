
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
import '../../../service/language_check/language_check.dart';
import '../../account/view/subscribe_now_screen.dart';
import '../../home/view/widget/social_menu_widget.dart';
import '../../home/view/widget/video_player_widget.dart';
import '../../my_account/controller/my_account_controller.dart';
import '../controller/video_details_controller.dart';
import 'widget/video_details_menu_widget.dart';
import 'widget/video_player_details_widget.dart';

class MovieVideoDetailsScreen extends StatefulWidget {
  final String slug;
  const MovieVideoDetailsScreen({
    super.key,
    required this.slug
  });
  @override
  State<MovieVideoDetailsScreen> createState() => _MovieVideoDetailsScreenState();
}

class _MovieVideoDetailsScreenState extends State<MovieVideoDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    final videoDetailsController = VideoDetailsController.current;
    final myAccountController = MyAccountController.current;

    final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await videoDetailsController.getMovieVideoDetails(slug: widget.slug);

      if(accessToken != null){
        myAccountController.getSubscribersMe();
      }
    });

    videoDetailsController.movieVideoDetailsModel = null;
    // Reset to portrait mode when exiting full-screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  bool isExploreClick = false;
  List<String> exploreList = [
    "Latest Shows",
    "Latest Movies",
    "Upcoming on NP",
    "All Shows",
    "All Movies",
  ];

  List<int> starList = [3, 2, 5, 4, 1,];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController){
      return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
        final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
        final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);
        log("Current Lang Code: $langCode");

        final movieVideoDetailsData = videoDetailsController.movieVideoDetailsModel?.data;
        final dubbedList = movieVideoDetailsData?.dubbed?.where((dubbed) => dubbed.language?.code.toString() == langCode).toList();
        
        final checkWatchList = (videoDetailsController.watchListModel?.data?.isNotEmpty == true &&
            videoDetailsController.watchListModel!.data!.any((watch) => watch.movieId == movieVideoDetailsData?.id));

        return Scaffold(
          key: scaffoldKey,
          body: GlobalContainer(
            height: size(context).height,
            width: size(context).width,
            color: ColorRes.appBackColor,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll){
                overScroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(27),

                    // ==# Video Player
                    dubbedList != null && dubbedList.isNotEmpty ?
                    ListView.builder(
                      itemCount: dubbedList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index){
                        return dubbedList[index].language?.code == langCode
                            ? VideoPlayerDetailsWidget(
                            videoSrc: dubbedList[index].video ?? "",
                            initImg: movieVideoDetailsData?.thumbnail ?? "")
                            : const SizedBox.shrink();
                      },
                    ) : const SizedBox.shrink(),

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
                                          str: LanguageCheck.checkLanguage(
                                            langCode: langCode,
                                            enText: movieVideoDetailsData?.title ?? "",
                                            bnText: movieVideoDetailsData?.titleBn ?? "",
                                            hiText: movieVideoDetailsData?.titleHi ?? "",
                                            arText: movieVideoDetailsData?.titleAr ?? "",
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),

                                        sizedBoxH(3),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: starList.asMap().entries.map((item){
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
                                                children: videoDetailsController.movieVideoDetailsModel?.data?.genres?.asMap().entries.map((genre){
                                                  return Padding(
                                                    padding: EdgeInsets.only(left: genre.key > 0 ? 5 : 0),
                                                    child: Row(
                                                      children: [
                                                        genre.key > 0 ?
                                                        Container(
                                                          height: 5,
                                                          width: 5,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(100),
                                                              color: ColorRes.white
                                                          ),
                                                        ) : const SizedBox.shrink(),
                                                        genre.key > 0 ? sizedBoxW(5) : const SizedBox.shrink(),
                                                        GlobalText(
                                                          str: LanguageCheck.checkLanguage(
                                                            langCode: langCode,
                                                            enText: genre.value.name ?? "",
                                                            bnText: genre.value.nameBn ?? "",
                                                            hiText: genre.value.nameHi ?? "",
                                                            arText: genre.value.nameAr ?? "",
                                                          ),
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }).toList() ?? [],
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
                                          children: videoDetailsController.movieVideoDetailsModel?.data?.tags?.asMap().entries.map((tags){
                                            return Padding(
                                              padding: EdgeInsets.only(left: tags.key > 0 ? 5 : 0),
                                              child: GlobalText(
                                                str: LanguageCheck.checkLanguage(
                                                  langCode: langCode,
                                                  enText: tags.value.name ?? "",
                                                  bnText: tags.value.nameBn ?? "",
                                                  hiText: tags.value.nameHi ?? "",
                                                  arText: tags.value.nameAr ?? "",
                                                ),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            );
                                          }).toList() ?? [],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                sizedBoxW(10),
                                GlobalButtonWidget(
                                  str: "Subscribe",
                                  height: 30,
                                  width: 70,
                                  buttomColor: ColorRes.appRedColor,
                                  textSize: 11,
                                  onTap: (){
                                    Get.to(()=> const SubscribeNowScreen());
                                  },
                                ),
                              ],
                            ),

                            sizedBoxH(5),
                            SizedBox(
                              child: ExpandableDescription(
                                description: LanguageCheck.checkLanguage(
                                  langCode: langCode,
                                  enText: movieVideoDetailsData?.description ?? "",
                                  bnText: movieVideoDetailsData?.descriptionBn ?? "",
                                  hiText: movieVideoDetailsData?.descriptionHi ?? "",
                                  arText: movieVideoDetailsData?.descriptionAr ?? "",
                                ),
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
                                      onTap: (){
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
                                                        return VideoPlayerWidget(
                                                          videoSrc: "${AppConfig.base.url}${trailer.url}",
                                                          initImg: movieVideoDetailsData?.thumbnail ?? "",
                                                          close: true,
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              }
                                          );
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
                                              child: GlobalImageLoader(
                                                  imagePath: Images.playBuIc,
                                                  height: 25,
                                                  width: 25,
                                                  color: ColorRes.appRedColor
                                              ),
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
                                      onTap: () async{
                                        if(subscribersId != null){
                                          videoDetailsController.reqWatchList(
                                              subscriberId: subscribersId,
                                              movieId: movieVideoDetailsData?.id.toString()
                                          );
                                        } else{
                                          showDialog(
                                            context: context,
                                            builder: (ctx){
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
                                                imagePath: checkWatchList && subscribersId != null
                                                    ? Images.checkIc
                                                    : Images.addIc,
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
                                      onTap: (){
                                        if(movieVideoDetailsData?.slug != null){
                                          final movieLink = "https://ott-nebula.vercel.app/$langCode/movie/${movieVideoDetailsData?.slug}";
                                          final movieName = movieVideoDetailsData?.title ?? "";

                                          try{
                                            // Share the movie link using share_plus
                                            Share.share('$movieName\n\n$movieLink',
                                                subject: 'Watch $movieName on Nebula OTT'
                                            );


                                            log('Movie Link: $movieName\n\n$movieLink');
                                          } catch(e, s){
                                            log("Error: ", error: e, stackTrace: s);
                                          }

                                        }  else {
                                          showCustomSnackBar("Unable to share the movie link", icon: Icons.error);
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: GlobalImageLoader(
                                                  imagePath: Images.shareDetailsIc,
                                                  height: 20,
                                                  width: 20,
                                                  color: ColorRes.white
                                              ),
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
                        )
                    ),

                    sizedBoxH(15),
                    ListView.builder(
                      itemCount: 12,
                      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return VideoDetailsMenuWidget(
                          img: Images.justiceLeagueImg,
                          text: "Best Of Tagore Song | Rabindra Sangeet Juke Box | Trissha Chatterjee | Bob Sn",
                          subText: "Trisha Chatterjje",
                          onTap: (){},
                          moreVertOnTap: (){

                          },
                        );
                      },
                    ),

                    sizedBoxH(20),
                    Container(
                      width: size(context).width,
                      color: ColorRes.appColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          sizedBoxH(10),
                          const GlobalImageText(
                            str: "NP",
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),

                          sizedBoxH(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialMenuWidget(
                                img: Images.facebookIc,
                                onTap: (){},
                              ),

                              sizedBoxW(10),
                              SocialMenuWidget(
                                img: Images.instagramIc,
                                onTap: (){},
                              ),

                              sizedBoxW(10),
                              SocialMenuWidget(
                                img: Images.linkedInIc,
                                onTap: (){},
                              ),
                            ],
                          ),

                          sizedBoxH(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialMenuWidget(
                                img: Images.youtubeIc,
                                onTap: (){},
                              ),

                              sizedBoxW(10),
                              SocialMenuWidget(
                                img: Images.twitterIc,
                                onTap: (){},
                              ),
                            ],
                          ),

                          sizedBoxH(30),
                          Container(
                            width: size(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: ColorRes.white),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isExploreClick = !isExploreClick;
                                    });
                                  },
                                  child: const SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GlobalText(
                                            str: "Explore",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: ColorRes.white,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                isExploreClick == true ?
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 8),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: exploreList.asMap().entries.map((item){
                                        return Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: GlobalText(
                                            str: item.value,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        );
                                      }).toList()
                                  ),
                                ) : const SizedBox.shrink()
                              ],
                            ),
                          ),

                          sizedBoxH(10),
                          Container(
                            width: size(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: ColorRes.white),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isExploreClick = !isExploreClick;
                                    });
                                  },
                                  child: const SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GlobalText(
                                            str: "Company",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: ColorRes.white,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                isExploreClick == true ?
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 8),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: exploreList.asMap().entries.map((item){
                                        return Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: GlobalText(
                                            str: item.value,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        );
                                      }).toList()
                                  ),
                                ) : const SizedBox.shrink()
                              ],
                            ),
                          ),

                          sizedBoxH(10),
                          Container(
                            width: size(context).width,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: ColorRes.white),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isExploreClick = !isExploreClick;
                                    });
                                  },
                                  child: const SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GlobalText(
                                            str: "Contract",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: ColorRes.white,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                isExploreClick == true ?
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 8),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: exploreList.asMap().entries.map((item){
                                        return Container(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: GlobalText(
                                            str: item.value,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        );
                                      }).toList()
                                  ),
                                ) : const SizedBox.shrink()
                              ],
                            ),
                          ),

                          sizedBoxH(20),
                          const GlobalText(
                            str: "Copyright © 2024 NP",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),

                          sizedBoxH(20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
