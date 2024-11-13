import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../video_details/view/hundred_days_basic_english_course_details_screen.dart';
import '../../components/home_section_see_all/home_section_recent_see_all_screen.dart';
import '../movie_menu_bar_widget.dart';
import '../basic_english_course_enu_widget.dart';

class HundredDaysBasicEnglishCourseWidget extends StatefulWidget {
  final String id;
  const HundredDaysBasicEnglishCourseWidget({super.key, required this.id,});

  @override
  State<HundredDaysBasicEnglishCourseWidget> createState() => _HundredDaysBasicEnglishCourseWidgetState();
}

class _HundredDaysBasicEnglishCourseWidgetState extends State<HundredDaysBasicEnglishCourseWidget> {
  // Sample static data list
  final List<Map<String, dynamic>> staticData = [
    {
      "type": "movie",
      "thumbnail": "assets/dummy_img/course-1024x576.png",
      "title": "100 Days Basic English Course",
      "videoAccess": true,
      "slug": "basic-english-course",
    },
    {
      "type": "series",
      "thumbnail": "assets/dummy_img/course-1024x576.png",
      "title": "100 Days Spoken English Practice",
      "videoAccess": false,
      "slug": "spoken-english-practice",
    },
    {
      "type": "series",
      "thumbnail": "assets/dummy_img/course-1024x576.png",
      "title": "Beginner Spoken English",
      "videoAccess": false,
      "slug": "beginner-spoken-english",
    },
    {
      "type": "series",
      "thumbnail": "assets/dummy_img/course-1024x576.png",
      "title": "Spoken English Practice",
      "videoAccess": false,
      "slug": "spoken-english-practice",
    },
    {
      "type": "series",
      "thumbnail": "assets/dummy_img/course-1024x576.png",
      "title": "English Grammar Course",
      "videoAccess": false,
      "slug": "english-grammar-course",
    },
    // Add more static items as needed
  ];


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
            text: "100 Days Basic English Course",
            seeAllOnTap: () {
              Get.to(() => const HomeSectionRecentSeeAllScreen(sectionId: "static-section-id"));
            },
          ),
          sizedBoxH(5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: staticData.map((recent) {
                return BasicEnglishCourseMenuWidget(
                  img: recent["thumbnail"],
                  title: recent["title"],
                 // subText: recent[""],
                  onTap: () {
                    // Get.to(() => HundredDaysBasicEnglishCourseVideoDetailsScreen(
                    //   id: recent.id,
                    //   title: recent.title,
                    //   shortDescription: recent.shortDescription,
                    //   youtubeLink: recent.youtubeLink,
                    // ));
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
