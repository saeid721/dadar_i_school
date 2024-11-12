
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:share_plus/share_plus.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../global/constants/images.dart';
import '../../../global/utils/show_toast.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_text.dart';
import '../../../initializer.dart';
import '../../../service/auth/view/auth_screen.dart';
import '../../../service/language_check/language_check.dart';
import '../../footer/footer_view_screen.dart';
import '../controller/video_details_controller.dart';
import 'widget/series_video_menu_widget/season_section_menu_widget.dart';
import 'widget/video_player_details_widget.dart';

class SeriesVideoDetailsScreen extends StatefulWidget {
  final String slug;
  const SeriesVideoDetailsScreen({
    super.key,
    required this.slug
  });
  @override
  State<SeriesVideoDetailsScreen> createState() => _SeriesVideoDetailsScreenState();
}

class _SeriesVideoDetailsScreenState extends State<SeriesVideoDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    final videoDetailsController = VideoDetailsController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await videoDetailsController.getSeriesVideoDetails(slug: widget.slug);
    });

    videoDetailsController.seriesVideoDetailsModel = null;
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
    return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
      final seriesVideoDetailsData = videoDetailsController.seriesVideoDetailsModel?.data;
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);
      log("Current Lang Code: $langCode");

      // Access the last season's trailers
      final seasons = videoDetailsController.seriesVideoDetailsModel?.data?.seasons;
      final lastSeason = seasons != null && seasons.isNotEmpty ? seasons.last : null;
      final trailerList = lastSeason?.trailers?.where((trailer) => trailer.language?.code.toString() == langCode).toList();

  
      final checkWatchList = (videoDetailsController.watchListModel?.data?.isNotEmpty == true &&
          videoDetailsController.watchListModel!.data!.any((watch) => watch.seriesId == seriesVideoDetailsData?.id));

      log("Current Lang Code List: ${trailerList?.map((video)=> video.language?.code)}");
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
                  trailerList != null && trailerList.isNotEmpty ?
                  ListView.builder(
                    itemCount: trailerList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, index){
                      return trailerList[index].language?.code == langCode
                          ? VideoPlayerDetailsWidget(
                        videoSrc: trailerList[index].url ?? "",
                        initImg: seriesVideoDetailsData?.thumbnail ?? "",
                        videoText: LanguageCheck.checkLanguage(
                          langCode: langCode,
                          enText: seriesVideoDetailsData?.title ?? "",
                          bnText: seriesVideoDetailsData?.titleBn ?? "",
                          hiText: seriesVideoDetailsData?.titleHi ?? "",
                          arText: seriesVideoDetailsData?.titleAr ?? "",
                        ),
                      )
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
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: seriesVideoDetailsData?.title ?? "",
                                    bnText: seriesVideoDetailsData?.titleBn ?? "",
                                    hiText: seriesVideoDetailsData?.titleHi ?? "",
                                    arText: seriesVideoDetailsData?.titleAr ?? "",
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
                                        final imdbRating = seriesVideoDetailsData?.imdbRating ?? 0;
                                        return Icon(
                                          Icons.star,
                                          color: item.key < imdbRating ? ColorRes.appRedColor : ColorRes.grey,
                                          size: 12,
                                        );
                                      }).toList(),
                                    ),
                                    sizedBoxW(5),
                                    GlobalText(
                                      str: double.tryParse(seriesVideoDetailsData?.imdbRating.toString() ?? '0').toString(),
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
                                        children: seriesVideoDetailsData?.genres?.asMap().entries.map((genre){
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

                                    ],
                                  ),
                                ),
                                sizedBoxW(3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: seriesVideoDetailsData?.tags?.asMap().entries.map((tags){
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

                          sizedBoxH(5),
                          SizedBox(
                            child: ExpandableDescription(
                              description: LanguageCheck.checkLanguage(
                                langCode: langCode,
                                enText: seriesVideoDetailsData?.description ?? "",
                                bnText: seriesVideoDetailsData?.descriptionBn ?? "",
                                hiText: seriesVideoDetailsData?.descriptionHi ?? "",
                                arText: seriesVideoDetailsData?.descriptionAr ?? "",
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
                                    onTap: () async{
                                      if(subscribersId != null){
                                        videoDetailsController.reqWatchList(
                                            subscriberId: subscribersId,
                                            seriesId: seriesVideoDetailsData?.id.toString()
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
                                      if(seriesVideoDetailsData?.slug != null){
                                        final movieLink = "https://ott-nebula.vercel.app/$langCode/series/${seriesVideoDetailsData?.slug}";
                                        final movieName = seriesVideoDetailsData?.title ?? "";

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

                  /// =============@/ Season & Episode /@ =================
                  sizedBoxH(15),
                  const SeriesDetailsSeriesMenuScreen(),

                  sizedBoxH(20),
                  const FooterViewScreen()

                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
