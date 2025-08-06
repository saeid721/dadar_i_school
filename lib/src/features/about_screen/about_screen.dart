import 'package:flutter/material.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../global/widget/global_image_loader.dart';
import '../../global/widget/global_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        elevation: 1,
        shadowColor: ColorRes.white200,
        iconTheme: const IconThemeData(color: ColorRes.appColor),
        title: const Text(
          'Dadar i School',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorRes.appColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            GlobalImageLoader(
              imagePath: Images.appLogo,
              height: 140,
              width: 140,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    str:
                        """ "Welcome to our English Learning App, powered by the engaging video lessons of Dadar i School. Our mission is to make spoken English simple, practical, and fun for everyone.
Through carefully selected YouTube videos, we bring you step-by-step lessons, everyday conversations, pronunciation tips, and grammar guidance — all in one place.
Whether you’re a beginner or improving your skills, our goal is to help you speak confidently and fluently in real life.
                        """,
                    fontSize: 15,
                    color: ColorRes.black,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  GlobalText(
                    str: "Learn. Practice. Speak.",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
