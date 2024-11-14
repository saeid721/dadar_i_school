import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_sized_box.dart';
import '../controller/home_controller.dart';
import 'widget/carousel_slider_widget/carousel_slider_widget.dart';
import 'widget/home_section_widget/beginner_spoken_english_widget.dart';
import 'widget/home_section_widget/english_grammar_course_widget.dart';
import 'widget/home_section_widget/hundred_days_basic_english_course_widget.dart';
import 'widget/home_section_widget/hundred_days_spoken_english_practice_widget.dart';
import 'widget/home_section_widget/spoken_english_practice_widget.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          body: GlobalContainer(
            color: ColorRes.appNavyColor,
            height: size(context).height,
            width: size(context).width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Carousel Slider
                  buildCarouselSlider(),

                  // List of Sections
                  ListView.builder(
                    itemCount: controller.sections.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      final sectionData = controller.sections[index];
                      switch (sectionData.sectionType) {
                        case "hundred_days_spoken_english":
                          return HundredDaysSpokenEnglishPracticeWidget(id: sectionData.id, );
                        case "hundred_days_basic_english":
                          return HundredDaysBasicEnglishCourseWidget(id: sectionData.id);
                        case "beginner_spoken_english":
                          return BeginnerSpokenEnglishWidget(id: sectionData.id);
                        case "spoken_english_practice":
                          return SpokenEnglishPracticeWidget(id: sectionData.id);
                        case "english_grammar_course":
                          return EnglishGrammarCourseWidget(id: sectionData.id);
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
