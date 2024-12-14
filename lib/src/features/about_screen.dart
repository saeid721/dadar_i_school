import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/constants/colors_resources.dart';
import '../global/widget/global_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const GlobalText(
              str: "About Trainer",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorRes.white,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: ColorRes.appBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: GlobalText(
                  str: "Mr. Sudip Paul (SRP)",
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  color: ColorRes.appColor,
                ),
              ),
            ),
            expandedHeight: 300.0,
            pinned: true,
            centerTitle: true,
            backgroundColor: ColorRes.appColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/app_src/ischool.png',
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GlobalText(
                      str:
                      """Hi, I'm Sudip Paul (SRP) an explorer, fitness influencer and Spoken English Trainer. I teach Spoken English and communication skills in my Mother tongue Bengali. I believe that English is not a tough language but due to a lot of obstacles and fear in mind people give up their learning and compromise on their Career, Social relationships and many possibilities. Through my videos I  always motivate people to learn and grow in all the aspects of their lives. 

If you believe in yourself and practice enough you can do anything you want; English is just a language. 
""",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
