import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/beginner_spoken_english_data.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../video_details/view/hundred_days_basic_english_course_details_screen.dart';
import '../../components/home_section_see_all/home_section_recent_see_all_screen.dart';
import '../basic_english_course_menu_widget.dart';
import '../movie_menu_bar_widget.dart';


class BeginnerSpokenEnglishWidget extends StatefulWidget {
  final String id;

  const BeginnerSpokenEnglishWidget({
    super.key,
    required this.id,
  });

  @override
  State<BeginnerSpokenEnglishWidget> createState() =>
      _BeginnerSpokenEnglishWidgetState();
}

class _BeginnerSpokenEnglishWidgetState
    extends State<BeginnerSpokenEnglishWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxH(10),
          MovieMenuBarWidget(
            text: "Beginner Spoken English",
            seeAllOnTap: () {
              Get.to(() => const HomeSectionRecentSeeAllScreen());
            },
          ),
          sizedBoxH(5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: beginnerSpokenEnglishData.map((recent) {
                return BasicEnglishCourseMenuWidget(
                  thumbnail: recent.thumbnail,
                  title: recent.title,
                  onTap: () {
                    Get.to(() => HundredDaysBasicEnglishCourseVideoDetailsScreen(
                      id: recent.id,
                      title: recent.title,
                      shortDescription: recent.shortDescription,
                      thumbnail: recent.thumbnail,
                      youtubeLink: recent.youtubeLink,
                    ));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
