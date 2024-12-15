import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/about_screen.dart';
import '../../features/contact_screen.dart';
import '../constants/colors_resources.dart';
import '../constants/enum.dart';
import '../constants/images.dart';
import 'global_image_loader.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorRes.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 185,
            child: DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFF361334),
                    const Color(0xFF4150B5),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Dadar i School',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.w700),
                  // ),
                  GlobalImageLoader(
                    imagePath: Images.appLogo,
                    width: 120,
                    fit: BoxFit.cover,
                    imageFor: ImageFor.asset,
                  ),
                  // Text(
                  //   ' The English Learning School',
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('About Trainer'),
            leading: GlobalImageLoader(
              imagePath: Images.info,
              width: 30,
            ),
            onTap: () {
              Get.to(() => const AboutUsScreen());
            },
          ),
          ListTile(
            title: const Text('Rate Our App'),
            leading: GlobalImageLoader(
              imagePath: Images.stars,
              width: 30,
            ),
            onTap: () {
              //Get.to(() => const RateOurApp());
            },
          ),
          ListTile(
            title: const Text('Send Feedback'),
            leading: GlobalImageLoader(
              imagePath: Images.feedback,
              width: 30,
            ),
            onTap: () {
              //Get.to(() => SendFeedback());
            },
          ),
          ListTile(
            title: const Text('Share Your Friends'),
            leading: GlobalImageLoader(
              imagePath: Images.share,
              width: 30,
            ),
            onTap: () {
              //Get.to(() => const ShareYourFriends());
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            leading: GlobalImageLoader(
              imagePath: Images.contact,
              width: 30,
            ),
            onTap: () {
              Get.to(() => const ContactUsScreen());
            },
          ),
          const SizedBox(height: 5),
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 1)),
            ),
            padding: const EdgeInsets.only(top: 5),
            child: const Column(
              children: [
                Text(
                  'Developed by',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Flutter Bangla',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.appColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Fb.com/FlutterBangla',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(left: 15, right: 15),
          //   child: const DrawerSocialMediaIconWidget(),
          // ),
        ],
      ),
    );
  }
}
