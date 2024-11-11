
import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import '../../../../../global/constants/enum.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../model/home_section/home_section_poster_slider_series_model.dart';

class HomeSectionPosterSeriesCarouselSliderWidget extends StatelessWidget {
  final String img;
  final String text;
  final String subText;
  final int imdbRating;
  final List<HomeSectionPosterSliderSeriesGenres>? genres;
  final Function() onTap;
  final Function() streamNowOnTap;
  const HomeSectionPosterSeriesCarouselSliderWidget({
    super.key,
    required this.img,
    required this.text,
    required this.subText,
    required this.imdbRating,
    required this.genres,
    required this.onTap,
    required this.streamNowOnTap,
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
      onTap: (){

      },
      child: Stack(
        children: [
          GlobalImageLoader(
            imagePath: img,
            fit: BoxFit.cover,
            height: 300,
            imageFor: ImageFor.network,
          ),
          Container(
            height: 300,
            width: size(context).width,
            decoration: BoxDecoration(
                color: ColorRes.black.withOpacity(0.5)
            ),
          ),
          Center(
            child: Container(
                width: size(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const GlobalText(
                          str: "Genres: ",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorRes.appRedColor,
                        ),

                        Row(
                          children: genres?.asMap().entries.map((genre){
                            return Padding(
                              padding: EdgeInsets.only(left: genre.key > 0 ? 5 : 0),
                              child: Row(
                                children: [
                                  genre.key > 0 ?
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: ColorRes.white
                                    ),
                                  ) : const SizedBox.shrink(),
                                  sizedBoxW(5),
                                  GlobalText(
                                    str: "${genre.value.name}",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            );
                          }).toList() ?? [],
                        )
                      ],
                    ),

                    GlobalText(
                      str: text,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),

                    sizedBoxH(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: starList.asMap().entries.map((item){
                            return Icon(
                              Icons.star,
                              color: item.key < imdbRating ? ColorRes.appRedColor : ColorRes.grey,
                              size: 12,
                            );
                          }).toList(),
                        ),
                        sizedBoxW(5),
                        const GlobalText(
                          str: '4.5',
                          fontWeight: FontWeight.w600,
                        ),
                        sizedBoxW(10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: ColorRes.yellow
                          ),
                          child: const GlobalText(
                            str: "IMDb",
                            fontWeight: FontWeight.bold,
                            color: ColorRes.black,
                          ),
                        ),
                        // sizedBoxW(5),
                        // const GlobalText(
                        //   str: '2 Hr: 14 Min's',
                        //   fontWeight: FontWeight.bold,
                        //   color: ColorRes.white,
                        // ),
                      ],
                    ),

                    sizedBoxH(20),
                    GestureDetector(
                      onTap: streamNowOnTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: ColorRes.appRedColor
                        ),
                        child: const GlobalText(
                          str: "Stream Now",
                          fontWeight: FontWeight.bold,
                          color: ColorRes.white,
                        ),
                      ),
                    ),

                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}
