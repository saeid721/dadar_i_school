import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';

class HundredDaysBasicEnglishSeeAllMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;
  const HundredDaysBasicEnglishSeeAllMenuWidget({
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
        width: size(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorRes.appSecondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: .5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5)
              ),
              child: GlobalImageLoader(
                imagePath: thumbnail,
                height: 120,
                width: size(context).width,
                fit: BoxFit.fill,
                imageFor: ImageFor.network,
              ),
            ),
            sizedBoxH(3),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GlobalText(
                str: title,
                fontSize: 13,
                maxLines: 2,
                color: ColorRes.appColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
