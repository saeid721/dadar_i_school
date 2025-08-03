import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/widget/global_progress_hub.dart';
import '../../../video_details/view/hundred_days_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../hundred_days_spoken_english_see_all_screen/hundred_days_spoken_english_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'english_grammar_course_see_all_widget.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalCourseHeader(
              title: "100 Days Spoken English",
              subtitle: "Advanced conversation skills",
              icon: Icons.chat_bubble_outline,
              gradientColors: [Colors.purple[400]!, Colors.purple[600]!],
              seeAllScreen: const HundredDaysSpokenEnglishSeeAllScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
      );
    });
  }
}
