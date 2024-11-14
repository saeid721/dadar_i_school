import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../../global/widget/global_appbar.dart';
import '../../../../video_details/view/hundred_days_basic_english_course_details_screen.dart';
import '../../../data/hundred_days_spoken_english_practice_data.dart';
import '../../../data/hundred_days_spoken_english_practice_data.dart';
import '../../widget/home_section_widget/home_section_see_all_menu_widget.dart';
import '../../../controller/home_controller.dart';

class HomeSectionRecentSeeAllScreen extends StatefulWidget {

  const HomeSectionRecentSeeAllScreen({
    super.key,
  });

  @override
  State<HomeSectionRecentSeeAllScreen> createState() => _HomeSectionRecentSeeAllScreenState();
}

class _HomeSectionRecentSeeAllScreenState extends State<HomeSectionRecentSeeAllScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Scaffold(
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppbarWidget(
                title: "100 Days Spoken English Practice",
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: homePageController.hundredDaysSpokenEnglishPracticeData.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: size(context).height < 700 ? 1.1 : 1.4,
                  ),
                  itemBuilder: (ctx, index) {
                    final courseData = homePageController.hundredDaysSpokenEnglishPracticeData[index];
                    return HomeSectionSeeAllMenuWidget(
                      thumbnail: courseData.thumbnail,
                      title: courseData.title,
                      onTap: () {
                        Get.to(() => HundredDaysBasicEnglishCourseVideoDetailsScreen(
                          id: courseData.id,
                          title: courseData.title,
                          shortDescription: courseData.shortDescription,
                          thumbnail: courseData.thumbnail,
                          youtubeLink: courseData.youtubeLink,
                        ));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
