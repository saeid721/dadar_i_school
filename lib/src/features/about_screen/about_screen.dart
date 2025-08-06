import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/widget/global_text.dart';

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
              str: "About App",
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
                  str: "About App",
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
                    """ "Welcome to our English Learning App, powered by the engaging video lessons of Dadar i School. Our mission is to make spoken English simple, practical, and fun for everyone.
Through carefully selected YouTube videos, we bring you step-by-step lessons, everyday conversations, pronunciation tips, and grammar guidance — all in one place.
Whether you’re a beginner or improving your skills, our goal is to help you speak confidently and fluently in real life.
                        """,
                    color: ColorRes.black,
                    textAlign: TextAlign.justify,
                  ),
                  GlobalText(
                    str: "Learn. Practice. Speak.",
                    color: ColorRes.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
