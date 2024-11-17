import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../video_details/view/hundred_days_basic_english_details_screen.dart';
import '../../components/home_section_see_all/hundred_days_basic_english_course_see_all_screen.dart';
import '../english_course_menu_widget.dart';
import '../movie_menu_bar_widget.dart';

class HundredDaysBasicEnglishWidget extends StatefulWidget {
  final String id;

  const HundredDaysBasicEnglishWidget({
    super.key,
    required this.id,
  });

  @override
  State<HundredDaysBasicEnglishWidget> createState() => _HundredDaysBasicEnglishWidgetState();
}

class _HundredDaysBasicEnglishWidgetState extends State<HundredDaysBasicEnglishWidget> {
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
            MovieMenuBarWidget(
              text: "100 Days Basic English Course",
              seeAllOnTap: () {
                Get.to(() => const HundredDaysBasicEnglishCourseSeeAllScreen());
              },
            ),
            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.map((recent) {
                      return BasicEnglishCourseMenuWidget(
                        thumbnail: recent.thumbnail ?? "",
                        title: recent.title ?? "",
                        onTap: () {
                          Get.to(() => HundredDaysBasicEnglishVideoDetailsScreen(
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
