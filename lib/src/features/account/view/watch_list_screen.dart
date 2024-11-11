
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage_keys.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/constants/images.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/initializer.dart';
import 'package:dadar_i_school/src/service/language_check/language_check.dart';
import '../../../global/widget/global_appbar.dart';
import '../../../global/widget/global_textform_field.dart';
import '../../../service/empty_data/empty_data_widget.dart';
import '../../video_details/controller/video_details_controller.dart';
import '../../video_details/view/movie_video_details_screen.dart';
import 'components/watch_more_vert_screen.dart';
import 'widget/watch_list_menu_widget.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key,});
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final subscriberId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);
    if(subscriberId != null){
      VideoDetailsController.current.getWatchList(
          subscriberId: locator<LocalStorage>().getString(key: StorageKeys.subscribersId)
      );
    }

  }

  DateTime? parseDate(String? dateString) {
    if (dateString == null) return null;
    try {
      return DateTime.parse(dateString); // Adjust parsing if necessary for your date format.
    } catch (e) {
      return null;
    }
  }

  String formatTimeDifference(DateTime? updatedAtDate) {
    if (updatedAtDate == null) return '';

    final currentDate = DateTime.now();
    final difference = currentDate.difference(updatedAtDate);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return '1 din ago';
    } else if (difference.inDays < 365 && updatedAtDate.year == currentDate.year) {
      return '${updatedAtDate.day} ${getMonthName(updatedAtDate.month)}';
    } else {
      return '${updatedAtDate.day} ${getMonthName(updatedAtDate.month)} ${updatedAtDate.year}';
    }
  }

  String getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          child: Column(
            children: [

              // ==# App Bar
              const GlobalAppbarWidget(
                title: "Watch List",
              ),

              Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        sizedBoxH(10),
                        GlobalTextFormField(
                          controller: searchCon,
                          hintText: "Search Movie & Series",
                          filled: true,
                          fillColor: ColorRes.bottomColor,
                          isDense: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            child: GlobalImageLoader(
                              imagePath: Images.searchIc,
                              color: ColorRes.white200,
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill,
                            ),
                          ),
                          sufixIcon: searchCon.text.isNotEmpty ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  searchCon.clear();
                                });
                              },
                              child: const GlobalImageLoader(
                                imagePath: Images.close,
                                color: ColorRes.white200,
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ) : const SizedBox.shrink(),
                          onChanged: (val){
                            setState(() {
                              searchCon.text = val;
                            });
                          },
                        ),

                        sizedBoxH(10),
                        Expanded(
                          child: videoDetailsController.watchListModel?.data?.isNotEmpty ?? false
                              ? ListView.builder(
                            itemCount: videoDetailsController.watchListModel?.data?.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              final reversedIndex = (videoDetailsController.watchListModel?.data?.length ?? 0) - 1 - index;
                              final watchListData = videoDetailsController.watchListModel?.data?[reversedIndex];
                              return WatchListMenuWidget(
                                img: "${watchListData?.movie?.thumbnail}",
                                text: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: watchListData?.movie?.title ?? "",
                                    bnText: watchListData?.movie?.titleBn ?? "",
                                    hiText: watchListData?.movie?.titleHi ?? "",
                                    arText: watchListData?.movie?.titleAr ?? ""
                                ),
                                viewText: "${watchListData?.movie?.views}",
                                timeText: watchListData?.updatedAt != null
                                    ? formatTimeDifference(parseDate(watchListData?.updatedAt))
                                    : '',
                                onTap: (){
                                  Get.to(()=> MovieVideoDetailsScreen(
                                    slug: watchListData?.movie?.slug ?? "",
                                  ));
                                },
                                moreVertOnTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (ctx){
                                        return WatchMoreVertScreen(
                                          movieId: watchListData?.movie?.id.toString() ?? "",
                                        );
                                      }
                                  );
                                },
                              );
                            },
                          ) : const EmptyDataWidget()
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
