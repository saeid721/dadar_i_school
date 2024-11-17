import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../video_details/view/hundred_days_basic_english_details_screen.dart';
import '../../controller/hundred_days_basic_english_controller.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../components/spoken_english_practice_see_all_screen.dart';
import 'english_course_menu_widget.dart';
import 'movie_menu_bar_widget.dart';

class SpokenEnglishPracticeWidget extends StatefulWidget {
  final String id;

  const SpokenEnglishPracticeWidget({
    super.key,
    required this.id,
  });

  @override
  State<SpokenEnglishPracticeWidget> createState() => _SpokenEnglishPracticeWidgetState();
}

class _SpokenEnglishPracticeWidgetState extends State<SpokenEnglishPracticeWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            MovieMenuBarWidget(
              text: "Spoken English Practice",
              seeAllOnTap: () {
                Get.to(() => const SpokenEnglishPracticeSeeAllScreen());
              },
            ),
            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.map((recent) {
                      return SpokenEnglishPracticeMenuWidget(
                        thumbnail: recent.thumbnail ?? "",
                        title: recent.title ?? "",
                        onTap: () {
                          Get.to(() => HundredDaysBasicEnglishVideoDetailsScreen(
                                id: recent.id.toString(),
                                title: recent.title ?? "",
                                shortDescription: recent.shortDescription ?? "",
                                thumbnail: recent.thumbnail ?? "",
                                youtubeLink: recent.youtubeLink ?? "",
                              ));
                        },
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ],
        ),
      );
    });
  }
}
