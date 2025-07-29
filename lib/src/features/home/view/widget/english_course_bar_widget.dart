
import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import '../../../../global/widget/global_text.dart';

class EnglishCourseMenuBarWidget extends StatelessWidget {
  final String? text;
  final bool? isSeeAll;
  final Function() seeAllOnTap;
  const EnglishCourseMenuBarWidget({
    super.key,
    this.text,
    this.isSeeAll = true,
    required this.seeAllOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GlobalText(
            str: text ?? '',
            fontSize: 16,
            color: ColorRes.appColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        isSeeAll == true ? GestureDetector(
          onTap: seeAllOnTap,
          child: const GlobalText(
            str: "See All",
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: ColorRes.deep300,
          ),
        ) : const SizedBox.shrink()
      ],
    );
  }
}
