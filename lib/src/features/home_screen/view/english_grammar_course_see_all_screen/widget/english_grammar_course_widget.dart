import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/widget/global_progress_hub.dart';
import '../../../controller/home_controller.dart';
import '../../widget/english_course_menu_widget.dart';
import '../english_grammar_course_see_all_screen.dart';
import '../english_grammar_course_video_details_screen.dart';
import 'english_grammar_course_see_all_widget.dart';

class EnglishGrammarCourseWidget extends StatefulWidget {
  final String id;

  const EnglishGrammarCourseWidget({
    super.key,
    required this.id,
  });

  @override
  State<EnglishGrammarCourseWidget> createState() => _EnglishGrammarCourseWidgetState();
}

class _EnglishGrammarCourseWidgetState extends State<EnglishGrammarCourseWidget> {
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
              title: "English Grammar Course",
              subtitle: "Perfect your grammar",
              icon: Icons.mic,
              gradientColors: [Colors.red[400]!, Colors.red[600]!],
              seeAllScreen: const EnglishGrammarCourseSeeAllScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: homePageController.englishGrammarCourseModel?.englishGrammarCourseList?.map((recent) {
                        return EnglishGrammarCourseMenuWidget(
                          thumbnail: recent.thumbnail ?? "",
                          title: recent.title ?? "",
                          onTap: () {
                            Get.to(() => EnglishGrammarCourseVideoDetailsScreen(
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
