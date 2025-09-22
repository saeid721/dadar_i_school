import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/enum.dart';
import '../../../global/constants/images.dart';
import '../../../global/model.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_text.dart';
import '../../about_screen/about_screen.dart';
import '../../about_trainer_screen/about_trainer_screen.dart';
import '../../contact_screen/contact_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../../privacy_policy_screen/privacy_policy_screen.dart';

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  int isClick = 0;
  final List<GlobalMenuModel> menuItem = [
    GlobalMenuModel(img: Images.homeInc, text: 'Home'),
    GlobalMenuModel(img: Images.info, text: 'About Trainer'),
    GlobalMenuModel(img: Images.aboutInc, text: 'About Us'),
    GlobalMenuModel(img: Images.contactInc, text: 'Contact Us'),
    GlobalMenuModel(img: Images.shareInc, text: 'Share Your Friends'),
    GlobalMenuModel(img: Images.ratingInc, text: 'Rate Our App'),
    GlobalMenuModel(img: Images.policyInc, text: 'Privacy & Policy'),
  ];

  // Function to handle app sharing
  void _shareApp() {
    const String message = "Check out this amazing app! [Your App Link Here]";
    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: Get.height,
        width: Get.width,
        color: ColorRes.white,
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  child: GlobalImageLoader(
                    imagePath: 'assets/app_src/ischool.png',
                    width: Get.width,
                    fit: BoxFit.cover,
                    imageFor: ImageFor.asset,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItem.length,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () async {
                          setState(() {
                            isClick = index;
                          });
                          log('Index: $index');
                          switch (index) {
                            case 0:
                              Get.to(() => const HomeScreen());
                              break;
                            case 1:
                              Get.to(() => const AboutTrainerScreen());
                              break;
                            case 2:
                              Get.to(() => const AboutUsScreen());
                              break;
                            case 3:
                              Get.to(() => const ContactScreen());
                              break;
                            case 4:
                              _shareApp(); // Trigger share app function
                              break;
                            case 5:
                            // Add any action for Rating here
                              break;
                            case 6:
                              Get.to(() => const AppPrivacyPolicyScreen());
                              break;
                          }
                        },
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isClick == index
                                ? ColorRes.appColor
                                : Colors.white,
                          ),
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              GlobalImageLoader(
                                imagePath: menuItem[index].img,
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                                imageFor: ImageFor.asset,
                              ),
                              const SizedBox(width: 10),
                              GlobalText(
                                str: menuItem[index].text,
                                color: isClick == index
                                    ? ColorRes.white
                                    : ColorRes.black,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Bottom Description and Loader
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GlobalText(
                      str: 'Version: 1.0.1',
                      color: ColorRes.deep300,
                      fontSize: 13,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
