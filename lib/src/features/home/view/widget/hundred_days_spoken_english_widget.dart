import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_progress_hub.dart';
import '../../../video_details/view/hundred_days_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../components/hundred_days_spoken_english_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'english_course_bar_widget.dart';

class HundredDaysSpokenEnglishWidget extends StatefulWidget {
  final String id;

  const HundredDaysSpokenEnglishWidget({
    super.key,
    required this.id,
  });

  @override
  State<HundredDaysSpokenEnglishWidget> createState() => _HundredDaysSpokenEnglishWidgetState();
}

class _HundredDaysSpokenEnglishWidgetState extends State<HundredDaysSpokenEnglishWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return ProgressHUD(
        inAsyncCall: homePageController.isLoading,
        child: Padding(
          padding: EdgeInsets.only( bottom: 10),
          child: GlobalContainer(
            backgroundColor: ColorRes.white,
            padding: const EdgeInsets.only(bottom: 10),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: EnglishCourseMenuBarWidget(
                    text: "100 Days Spoken English Course",
                    seeAllOnTap: () {
                      Get.to(() => const HundredDaysSpokenEnglishSeeAllScreen());
                    },
                  ),
                ),
                sizedBoxH(5),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: homePageController.hundredDaysSpokenEnglishModel?.hundredDaysSpokenEnglishList?.map((recent) {
                            return HundredDaysSpokenEnglishMenuWidget(
                              thumbnail: recent.thumbnail ?? "",
                              title: recent.title ?? "",
                              onTap: () {
                                Get.to(() => HundredDaysSpokenEnglishVideoDetailsScreen(
                                      id: recent.id.toString(),
                                      title: recent.title ?? "",
                                      shortDescription: recent.shortDescription ?? "",
                                      thumbnail: recent.thumbnail ?? "",
                                      youtubeLink: recent.youtubeLink ?? "",
                                    ));
                              },
                            );
                          }).toList() ??
                          [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
