import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/enum.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';

class HundredDaysBasicEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const HundredDaysBasicEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: thumbnail,
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
              ],
            ),
            GlobalText(
              str: title,
              fontSize: 12,
              maxLines: 1,
              color: ColorRes.appColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class BeginnerSpokenEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const BeginnerSpokenEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: thumbnail,
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
              ],
            ),
            GlobalText(
              str: title,
              fontSize: 12,
              maxLines: 1,
              color: ColorRes.appColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class HundredDaysSpokenEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const HundredDaysSpokenEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: thumbnail,
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
              ],
            ),
            GlobalText(
              str: title,
              fontSize: 12,
              maxLines: 1,
              color: ColorRes.appColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class SpokenEnglishPracticeMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const SpokenEnglishPracticeMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: thumbnail,
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
              ],
            ),
            GlobalText(
              str: title,
              fontSize: 12,
              maxLines: 1,
              color: ColorRes.appColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

class EnglishGrammarCourseMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const EnglishGrammarCourseMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: thumbnail,
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
              ],
            ),
            GlobalText(
              str: title,
              fontSize: 12,
              maxLines: 1,
              color: ColorRes.appColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
