
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../../global/widget/global_appbar.dart';
import '../../../../video_details/view/movie_video_details_screen.dart';
import '../../widget/home_section_widget/home_section_see_all_menu_widget.dart';
import '../../../controller/home_controller.dart';

class HomeSectionTopMovieSeeAllScreen extends StatefulWidget {
  final String sectionId;
  const HomeSectionTopMovieSeeAllScreen({
    super.key,
    required this.sectionId
  });
  @override
  State<HomeSectionTopMovieSeeAllScreen> createState() => _HomeSectionTopMovieSeeAllScreenState();
}

class _HomeSectionTopMovieSeeAllScreenState extends State<HomeSectionTopMovieSeeAllScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final homePageController = HomePageController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      homePageController.getHomeSectionTopMovie(limit: '50', sectionId: widget.sectionId);
    });

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppbarWidget(
                title: "Top Movie",
              ),

              Expanded(
                child: GridView.builder(
                  itemCount: homePageController.homeSectionTopMovieSeeAllModel?.data?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: size(context).height < 700 ? 1.1 : 1.4,
                  ),
                  itemBuilder: (ctx, index) {
                    final homePageRecentData = homePageController.homeSectionTopMovieSeeAllModel?.data?[index];
                    return HomeSectionSeeAllMenuWidget(
                      img: "${homePageRecentData?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: homePageRecentData?.title ?? "",
                        bnText: homePageRecentData?.titleBn ?? "",
                        hiText: homePageRecentData?.titleHi ?? "",
                        arText: homePageRecentData?.titleAr ?? "",
                      ),
                      subText: "Free",
                      onTap: () {
                        Get.to(()=> MovieVideoDetailsScreen(
                          slug: homePageRecentData?.slug ?? "",
                        ));
                      },
                    );
                  },
                ),
              )

            ],
          ),
        ),
      );
    });
  }
}
