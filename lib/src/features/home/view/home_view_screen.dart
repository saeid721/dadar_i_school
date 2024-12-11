import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_progress_hub.dart';
import '../../../global/widget/global_text.dart';
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
  late final HomePageController homePageController;

  @override
  void initState() {
    super.initState();
    homePageController = HomePageController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        homePageController.getHundredDaysBasicEnglishList(),
        homePageController.getBeginnerSpokenEnglishList(),
        homePageController.getHundredDaysSpokenEnglishList(),
        homePageController.getSpokenEnglishPracticeList(),
        homePageController.getEnglishGrammarCourseList(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          body: ProgressHUD(
            inAsyncCall: controller.isLoading,
            child: GlobalContainer(
              color: ColorRes.appBackgroundColor,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    toolbarHeight: 70,
                    expandedHeight: 300.0,
                    pinned: true,
                    backgroundColor: ColorRes.appColor,
                    flexibleSpace: FlexibleSpaceBar(
                      background: buildCarouselSlider(),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: ColorRes.appBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: const GlobalText(
                          str: "Dadar i School - The English Learning School",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          color: ColorRes.appColor,
                        ),
                      ),
                    ),
                  ),

                  // List of Sections
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (ctx, index) {
                        final sectionData = controller.homeSectionList[index];
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
                      childCount: controller.homeSectionList.length,
                    ),
                  ),

                  // Extra spacing at the bottom
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 100),
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