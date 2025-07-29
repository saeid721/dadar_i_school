import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/widget/global_progress_hub.dart';
import '../../../video_details/view/beginner_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../components/beginner_spoken_english_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'english_grammar_course_see_all_widget.dart';

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
      return ProgressHUD(
        inAsyncCall: homePageController.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlobalCourseHeader(
              title: "Beginner Spoken English",
              subtitle: "Start speaking confidently",
              icon: Icons.record_voice_over,
              gradientColors: [Colors.green[400]!, Colors.green[600]!],
              seeAllScreen: const BeginnerSpokenEnglishSeeAllScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: SingleChildScrollView(
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
            ),
          ],
        ),
      );
    });
  }
}
