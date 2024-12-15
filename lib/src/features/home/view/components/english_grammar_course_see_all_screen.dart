import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_text.dart';
import '../../../video_details/view/english_grammar_course_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/carousel_slider_widget/carousel_slider_widget.dart';
import '../widget/see_all_widget.dart';

class EnglishGrammarCourseSeeAllScreen extends StatefulWidget {
  const EnglishGrammarCourseSeeAllScreen({
    super.key,
  });

  @override
  State<EnglishGrammarCourseSeeAllScreen> createState() => _EnglishGrammarCourseSeeAllScreenState();
}

class _EnglishGrammarCourseSeeAllScreenState extends State<EnglishGrammarCourseSeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Scaffold(
        body: GlobalContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ColorRes.appBackgroundColor,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
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
                      color: ColorRes.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const GlobalText(
                      str: "English Grammar Course",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      color: ColorRes.appColor,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.15,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      final courseData = homePageController.englishGrammarCourseModel?.englishGrammarCourseList?[index];
                      return SeeAllMenuWidget(
                        thumbnail: courseData?.thumbnail ?? "",
                        title: courseData?.title ?? "",
                        onTap: () {
                          Get.to(() => EnglishGrammarCourseVideoDetailsScreen(
                                id: courseData?.id.toString() ?? "",
                                title: courseData?.title ?? "",
                                shortDescription: courseData?.shortDescription ?? "",
                                thumbnail: courseData?.thumbnail ?? "",
                                youtubeLink: courseData?.youtubeLink ?? "",
                              ));
                        },
                      );
                    },
                    childCount: homePageController.englishGrammarCourseModel?.englishGrammarCourseList?.length ?? 0,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      );
    });
  }
}
