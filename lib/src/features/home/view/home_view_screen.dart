import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../controller/home_controller.dart';
import 'widget/carousel_slider_widget/carousel_slider_widget.dart';
import 'widget/home_section_widget/beginner_spoken_english_widget.dart';
import 'widget/home_section_widget/english_grammar_course_widget.dart';
import 'widget/home_section_widget/hundred_days_basic_english_course_widget.dart';
import 'widget/home_section_widget/hundred_days_spoken_english_practice_widget.dart';
import 'widget/home_section_widget/spoken_english_practice_widget.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  @override
  void initState() {
    super.initState();
    final homePageController = HomePageController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await homePageController.getHundredDaysBasicEnglishCourseList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
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
                    itemCount: homePageController.sections.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      final sectionData = homePageController.sections[index];
                      switch (sectionData.sectionType) {
                        case "hundred_days_basic_english":
                          return HundredDaysBasicEnglishWidget(id: sectionData.id);
                        case "beginner_spoken_english":
                          return BeginnerSpokenEnglishWidget(id: sectionData.id);
                        case "hundred_days_spoken_english":
                          return HundredDaysSpokenEnglishWidget(
                            id: sectionData.id,
                          );
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
