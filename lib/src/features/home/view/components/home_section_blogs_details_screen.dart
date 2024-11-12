import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/date_time_formatter.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../initializer.dart';
import '../../../../service/language_check/language_check.dart';
import '../../controller/home_controller.dart';

class HomeSectionBlogsDetailsScreen extends StatefulWidget {
  final String blogId;
  const HomeSectionBlogsDetailsScreen({
    super.key,
    required this.blogId
  });

  @override
  State<HomeSectionBlogsDetailsScreen> createState() => _HomeSectionBlogsDetailsScreenState();
}

class _HomeSectionBlogsDetailsScreenState extends State<HomeSectionBlogsDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final homePageController = HomePageController.current;

    SchedulerBinding.instance.addPostFrameCallback((_)async{
      homePageController.getHomeSectionSingleBlogs(blogId: widget.blogId);

      homePageController.homeSectionSingleBlogsModel == null;
    });

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final homeSectionSingleBlogsData = homePageController.homeSectionSingleBlogsModel?.data;
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          child: Column(
            children: [
              const GlobalAppbarWidget(
                title: "Blog",
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalImageLoader(
                            imagePath: homeSectionSingleBlogsData?.banner ?? "",
                            height: 200,
                            width: size(context).width,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),

                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: homeSectionSingleBlogsData?.title ?? "",
                                    bnText: homeSectionSingleBlogsData?.titleBn ?? "",
                                    hiText: homeSectionSingleBlogsData?.titleHi ?? "",
                                    arText: homeSectionSingleBlogsData?.titleAr ?? "",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                GlobalText(
                                  str: (homeSectionSingleBlogsData?.createdAt != null && homeSectionSingleBlogsData!.createdAt!.isNotEmpty)
                                      ? DateTimeFormatter.showDayMonthYear.format(DateTime.tryParse(homeSectionSingleBlogsData.createdAt ?? "") ?? DateTime.now())
                                      : "Date not available",
                                  fontSize: 12,
                                ),


                                sizedBoxH(10),
                                SizedBox(
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: homeSectionSingleBlogsData?.description ?? "",
                                      bnText: homeSectionSingleBlogsData?.descriptionBn ?? "",
                                      hiText: homeSectionSingleBlogsData?.descriptionHi ?? "",
                                      arText: homeSectionSingleBlogsData?.descriptionAr ?? "",
                                    ),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
