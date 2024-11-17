import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../video_details/view/beginner_spoken_english_video_details_screen.dart';
import '../../../video_details/view/spoken_english_practice_video_details_screen.dart';
import '../../../video_details/view/video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../components/beginner_spoken_english_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'english_course_bar_widget.dart';

class BeginnerSpokenEnglishWidget extends StatefulWidget {
  final String id;

  const BeginnerSpokenEnglishWidget({
    super.key,
    required this.id,
  });

  @override
  State<BeginnerSpokenEnglishWidget> createState() => _BeginnerSpokenEnglishWidgetState();
}

class _BeginnerSpokenEnglishWidgetState extends State<BeginnerSpokenEnglishWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            EnglishCourseMenuBarWidget(
              text: "Beginner Spoken English Course",
              seeAllOnTap: () {
                Get.to(() => const BeginnerSpokenEnglishSeeAllScreen());
              },
            ),
            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.beginnerSpokenEnglishModel?.beginnerSpokenEnglishList?.map((recent) {
                      return BeginnerSpokenEnglishMenuWidget(
                        thumbnail: recent.thumbnail ?? "",
                        title: recent.title ?? "",
                        onTap: () {
                          Get.to(() => BeginnerSpokenEnglishVideoDetailsScreen(
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
          ],
        ),
      );
    });
  }
}
