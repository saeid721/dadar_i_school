import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'widget/carousel_slider_widget/carousel_slider_widget.dart';
import 'widget/home_section_widget/beginner_spoken_english_widget.dart';
import 'widget/home_section_widget/english_grammar_course_widget.dart';
import 'widget/home_section_widget/hundred_days_basic_english_course_widget.dart';
import 'widget/home_section_widget/hundred_days_spoken_english_practice_widget.dart';
import 'widget/home_section_widget/spoken_english_practice_widget.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
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
                      case "recent":
                        return HundredDaysSpokenEnglishPracticeWidget(id: sectionData.id, );
                      case "genres":
                        return HundredDaysBasicEnglishCourseWidget(id: sectionData.id);
                      case "upcoming":
                        return SpokenEnglishPracticeWidget(id: sectionData.id);
                      case "all_movies":
                        return BeginnerSpokenEnglishWidget(id: sectionData.id);
                      case "all_series":
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
        );
      },
    );
  }
}
