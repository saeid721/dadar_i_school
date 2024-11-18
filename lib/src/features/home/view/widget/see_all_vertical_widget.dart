import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';

class SeeAllMenuVerticalWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String shortDescription;
  final Function() onTap;
  const SeeAllMenuVerticalWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.shortDescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size(context).width,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorRes.bottomColor.withOpacity(0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)
                ),
                child: GlobalImageLoader(
                  imagePath: thumbnail,
                  height: 70,
                  width: size(context).width,
                  fit: BoxFit.fill,
                  imageFor: ImageFor.network,
                ),
              ),
            ),
            sizedBoxW(5),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      str: title,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GlobalText(
                      str: shortDescription,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
