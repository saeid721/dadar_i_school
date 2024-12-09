import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_progress_hub.dart';
import '../../../global/widget/global_sized_box.dart';
import '../controller/home_controller.dart';
import 'widget/beginner_spoken_english_widget.dart';
import 'widget/carousel_slider_widget/carousel_slider_widget.dart';
import 'widget/english_grammar_course_widget.dart';
import 'widget/hundred_days_basic_english_widget.dart';
import 'widget/hundred_days_spoken_english_widget.dart';
import 'widget/spoken_english_practice_english_widget.dart';

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
      await homePageController.getHundredDaysBasicEnglishList();
      await homePageController.getBeginnerSpokenEnglishList();
      await homePageController.getHundredDaysSpokenEnglishList();
      await homePageController.getSpokenEnglishPracticeList();
      await homePageController.getEnglishGrammarCourseList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (homePageController) {
        return Scaffold(
          body: ProgressHUD(
            inAsyncCall: homePageController.isLoading,
            child: GlobalContainer(
              color: ColorRes.appBackgroundColor,
              height: size(context).height,
              width: size(context).width,
              child: CustomScrollView(
                slivers: [
                  // Carousel Slider
                  SliverToBoxAdapter(
                    child: buildCarouselSlider(),
                  ),

                  // List of Sections
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (ctx, index) {
                        final sectionData = homePageController.homeSectionList[index];
                        switch (sectionData.sectionType) {
                          case "hundred_days_basic_english":
                            return HundredDaysBasicEnglishWidget(id: sectionData.id);
                          case "beginner_spoken_english":
                            return BeginnerSpokenEnglishWidget(id: sectionData.id);
                          case "hundred_days_spoken_english":
                            return HundredDaysSpokenEnglishWidget(id: sectionData.id);
                          case "spoken_english_practice":
                            return SpokenEnglishPracticeWidget(id: sectionData.id);
                          case "english_grammar_course":
                            return EnglishGrammarCourseWidget(id: sectionData.id);
                          default:
                            return const SizedBox.shrink();
                        }
                      },
                      childCount: homePageController.homeSectionList.length,
                    ),
                  ),

                  // Extra spacing at the bottom
                  SliverToBoxAdapter(
                    child: const SizedBox(height: 100),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
