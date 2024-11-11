
import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import '../../../../global/constants/enum.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';

class CarouselSliderWidget extends StatelessWidget {
  final String img;
  final String text;
  final String subText;
  final int imdbRating;
  final Function() onTap;
  final Function() watchTrailerOnTap;
  const CarouselSliderWidget({
    super.key,
    required this.img,
    required this.text,
    required this.subText,
    required this.imdbRating,
    required this.onTap,
    required this.watchTrailerOnTap,
  });

  @override
  Widget build(BuildContext context) {

    List<int> starList = [
      3,
      2,
      5,
      4,
      1,
    ];

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          GlobalImageLoader(
            imagePath: img,
            fit: BoxFit.cover,
            height: 550,
            imageFor: ImageFor.network,
          ),
          Container(
            height: 550,
            width: size(context).width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  ColorRes.appBackColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 5], // Make the black gradient only near the bottom
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
                width: size(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalImageText(
                                str: text,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: starList.asMap().entries.map((item){
                                  return Icon(
                                    Icons.star,
                                    color: item.key < imdbRating ? ColorRes.appRedColor : ColorRes.grey,
                                    size: 12,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: watchTrailerOnTap,
                          child: const GlobalImageLoader(
                            imagePath: Images.playBuIc,
                            height: 25,
                            width: 25,
                            color: ColorRes.appRedColor,
                          ),
                        ),

                        sizedBoxW(5)
                      ],
                    ),

                    sizedBoxH(10),
                    SizedBox(
                      child: GlobalText(
                        str: subText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        fontSize: 13,
                      ),
                    )
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
