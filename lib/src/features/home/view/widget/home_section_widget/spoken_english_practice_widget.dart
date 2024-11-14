import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/spoken_english_practice_data.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../video_details/view/hundred_days_basic_english_course_details_screen.dart';
import '../../components/home_section_see_all/hundred_days_basic_english_course_see_all_screen.dart';
import '../basic_english_course_menu_widget.dart';
import '../movie_menu_bar_widget.dart';


class SpokenEnglishPracticeWidget extends StatefulWidget {
  final String id;

  const SpokenEnglishPracticeWidget({
    super.key,
    required this.id,
  });

  @override
  State<SpokenEnglishPracticeWidget> createState() =>
      _SpokenEnglishPracticeWidgetState();
}

class _SpokenEnglishPracticeWidgetState
    extends State<SpokenEnglishPracticeWidget> {

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
            text: "Spoken English Practice",
            seeAllOnTap: () {
              Get.to(() => const HundredDaysBasicEnglishCourseSeeAllScreen());
            },
          ),
          sizedBoxH(5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: spokenEnglishPracticeData.map((recent) {
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
