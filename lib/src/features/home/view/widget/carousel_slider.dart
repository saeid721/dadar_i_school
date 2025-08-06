
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_container.dart';

CarouselSliderController buttonCarouselController = CarouselSliderController();

final List<String> imgList = [
  'assets/dummy_img/Daily-Talks-medium-1024x576.png',
  'assets/dummy_img/gammmar-basic-1024x576.png',
  'assets/dummy_img/grammar-medium-1024x576.png',
  'assets/dummy_img/Live-Practice-1024x576.png',
  'assets/dummy_img/Daily-Talks-basic.png',
  'assets/dummy_img/course-1024x576.png',
];

Widget buildCarouselSlider() {
  return CarouselSlider(
    items: imgList
        .map((item) => GlobalContainer(
      color: ColorRes.white,
      borderRadius: 10,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Image.asset(
          item,
          fit: BoxFit.fill,
          width: Get.width,
          height: 550,

        ),
      ),
    ))
        .toList(),
    carouselController: buttonCarouselController,
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 1.0,
      aspectRatio: 1.2,
      initialPage: 0,
    ),
  );
}

