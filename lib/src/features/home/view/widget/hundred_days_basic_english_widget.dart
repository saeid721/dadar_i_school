
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/widget/global_progress_hub.dart';
import '../../../video_details/view/hundred_days_basic_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../components/hundred_days_basic_english_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'english_grammar_course_see_all_widget.dart';

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
      return ProgressHUD(
        inAsyncCall: homePageController.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalCourseHeader(
              title: "100 Days Basic English",
              subtitle: "Master the fundamentals",
              icon: Icons.calendar_today,
              gradientColors: [Colors.blue[400]!, Colors.blue[600]!],
              seeAllScreen: const HundredDaysBasicEnglishSeeAllScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.map((recent) {
                        return HundredDaysBasicEnglishMenuWidget(
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
            ),
          ],
        ),
      );
    });
  }
}
