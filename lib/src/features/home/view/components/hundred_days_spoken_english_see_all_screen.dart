import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_text.dart';
import '../../../video_details/view/hundred_days_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/carousel_slider_widget/carousel_slider_widget.dart';
import '../widget/global_sliver_app_bar_widget.dart';
import '../widget/see_all_widget.dart';

class HundredDaysSpokenEnglishSeeAllScreen extends StatefulWidget {
  const HundredDaysSpokenEnglishSeeAllScreen({
    super.key,
  });

  @override
  State<HundredDaysSpokenEnglishSeeAllScreen> createState() => _HundredDaysSpokenEnglishSeeAllScreenState();
}

class _HundredDaysSpokenEnglishSeeAllScreenState extends State<HundredDaysSpokenEnglishSeeAllScreen> {
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
                backgroundColor: Colors.red[500]!,
                backgroundWidget: buildCarouselSlider(),
                title: "100 Days Spoken English",
                subtitle: "Advanced conversation skills",
                icon: Icons.chat_bubble_outline,
                titleColor: ColorRes.appColor,
                subtitleColor: Colors.grey[600]!,
              ),
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
                      str: "100 Days Spoken English Practice",
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
                      final courseData = homePageController.hundredDaysSpokenEnglishModel?.hundredDaysSpokenEnglishList?[index];
                      return SeeAllMenuWidget(
                        thumbnail: courseData?.thumbnail ?? "",
                        title: courseData?.title ?? "",
                        onTap: () {
                          Get.to(() => HundredDaysSpokenEnglishVideoDetailsScreen(
                                id: courseData?.id.toString() ?? "",
                                title: courseData?.title ?? "",
                                shortDescription: courseData?.shortDescription ?? "",
                                thumbnail: courseData?.thumbnail ?? "",
                                youtubeLink: courseData?.youtubeLink ?? "",
                              ));
                        },
                      );
                    },
                    childCount: homePageController.hundredDaysSpokenEnglishModel?.hundredDaysSpokenEnglishList?.length ?? 0,
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
