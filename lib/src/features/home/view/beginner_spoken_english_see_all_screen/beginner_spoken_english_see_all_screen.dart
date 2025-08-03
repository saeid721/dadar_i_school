import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/widget/global_container.dart';
import '../../../video_details/view/beginner_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/carousel_slider_widget/carousel_slider_widget.dart';
import '../widget/global_sliver_app_bar_widget.dart';
import '../widget/see_all_widget.dart';

class BeginnerSpokenEnglishSeeAllScreen extends StatefulWidget {
  const BeginnerSpokenEnglishSeeAllScreen({
    super.key,
  });

  @override
  State<BeginnerSpokenEnglishSeeAllScreen> createState() => _BeginnerSpokenEnglishSeeAllScreenState();
}

class _BeginnerSpokenEnglishSeeAllScreenState extends State<BeginnerSpokenEnglishSeeAllScreen> {
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
                backgroundColor: ColorRes.appColor,
                backgroundWidget: buildCarouselSlider(),
                title: "Beginner Spoken English",
                subtitle: "Start speaking confidently",
                imageUrl: Images.appLogo,
                titleColor: ColorRes.appColor,
                subtitleColor: Colors.grey[600]!,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .90,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      final courseData = homePageController.beginnerSpokenEnglishModel?.beginnerSpokenEnglishList?[index];
                      return SeeAllMenuWidget(
                        thumbnail: courseData?.thumbnail ?? "",
                        title: courseData?.title ?? "",
                        onTap: () {
                          Get.to(() => BeginnerSpokenEnglishVideoDetailsScreen(
                                id: courseData?.id.toString() ?? "",
                                title: courseData?.title ?? "",
                                shortDescription: courseData?.shortDescription ?? "",
                                thumbnail: courseData?.thumbnail ?? "",
                                youtubeLink: courseData?.youtubeLink ?? "",
                              ));
                        },
                      );
                    },
                    childCount: homePageController.beginnerSpokenEnglishModel?.beginnerSpokenEnglishList?.length ?? 0,
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
