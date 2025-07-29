import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';
import '../../../video_details/view/hundred_days_basic_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/carousel_slider_widget/carousel_slider_widget.dart';
import '../widget/global_sliver_app_bar_widget.dart';
import '../widget/see_all_widget.dart';

class HundredDaysBasicEnglishSeeAllScreen extends StatefulWidget {
  const HundredDaysBasicEnglishSeeAllScreen({super.key});

  @override
  State<HundredDaysBasicEnglishSeeAllScreen> createState() => _HundredDaysBasicEnglishSeeAllScreenState();
}

class _HundredDaysBasicEnglishSeeAllScreenState extends State<HundredDaysBasicEnglishSeeAllScreen> {
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
                title: "100 Days Basic English",
                subtitle: "Master the fundamentals",
                icon: Icons.calendar_today,
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
                    childAspectRatio: 1.15,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (ctx, index) {
                      final courseData = homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?[index];
                      return SeeAllMenuWidget(
                        thumbnail: courseData?.thumbnail ?? "",
                        title: courseData?.title ?? "",
                        onTap: () {
                          Get.to(() => HundredDaysBasicEnglishVideoDetailsScreen(
                                id: courseData?.id.toString() ?? "",
                                title: courseData?.title ?? "",
                                shortDescription: courseData?.shortDescription ?? "",
                                thumbnail: courseData?.thumbnail ?? "",
                                youtubeLink: courseData?.youtubeLink ?? "",
                              ));
                        },
                      );
                    },
                    childCount: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.length ?? 0,
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
