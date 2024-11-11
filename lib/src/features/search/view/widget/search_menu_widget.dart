
import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';

class SearchMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final String timeText;
  final String viewText;
  final Function() onTap;
  const SearchMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.timeText,
    required this.viewText,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size(context).width,
        margin: const EdgeInsets.only(
            bottom: 10
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: GlobalImageLoader(
                imagePath: img,
                height: 85,
                width: 140,
                imageFor: ImageFor.network,
                fit: BoxFit.fill,
              ),
            ),
            sizedBoxW(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: text,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // GlobalText(
                  //   str: subText,
                  //   fontSize: 9,
                  //   fontWeight: FontWeight.w300,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),

                  GlobalText(
                    str: timeText,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  GlobalText(
                    str: '$viewText Views',
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
