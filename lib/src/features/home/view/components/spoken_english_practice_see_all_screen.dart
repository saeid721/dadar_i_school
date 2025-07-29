import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';
import '../../../video_details/view/spoken_english_practice_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/carousel_slider_widget/carousel_slider_widget.dart';
import '../widget/global_sliver_app_bar_widget.dart';
import '../widget/see_all_widget.dart';

class SpokenEnglishPracticeSeeAllScreen extends StatefulWidget {
  const SpokenEnglishPracticeSeeAllScreen({
    super.key,
  });

  @override
  State<SpokenEnglishPracticeSeeAllScreen> createState() => _SpokenEnglishPracticeSeeAllScreenState();
}

class _SpokenEnglishPracticeSeeAllScreenState extends State<SpokenEnglishPracticeSeeAllScreen> {
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
              GlobalSliverAppBar(
                backgroundColor: Colors.orange[500]!,
                backgroundWidget: buildCarouselSlider(),
                title: "Spoken English Practice",
                subtitle: "Practice makes perfect",
                icon: Icons.mic,
                titleColor: ColorRes.appColor,
                subtitleColor: Colors.grey[600]!,
                expandedHeight: 250.0, // Custom height
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
                      final courseData = homePageController.spokenEnglishPracticeModel?.spokenEnglishPracticeList?[index];
                      return SeeAllMenuWidget(
                        thumbnail: courseData?.thumbnail ?? "",
                        title: courseData?.title ?? "",
                        onTap: () {
                          Get.to(() => SpokenEnglishPracticeVideoDetailsScreen(
                                id: courseData?.id.toString() ?? "",
                                title: courseData?.title ?? "",
                                shortDescription: courseData?.shortDescription ?? "",
                                thumbnail: courseData?.thumbnail ?? "",
                                youtubeLink: courseData?.youtubeLink ?? "",
                              ));
                        },
                      );
                    },
                    childCount: homePageController.spokenEnglishPracticeModel?.spokenEnglishPracticeList?.length ?? 0,
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
