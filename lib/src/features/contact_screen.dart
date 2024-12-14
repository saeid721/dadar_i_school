import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/constants/colors_resources.dart';
import '../global/widget/global_text.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const GlobalText(
              str: "Contact Us",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ColorRes.white,
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  color: ColorRes.appBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: const GlobalText(
                  str: "আস-সালামু আলাইকুম ওয়া রহমাতুল্লাহি ওয়া বারকাতুহু",
                  fontSize: 16,
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
                'assets/images/top_bg.jpg',
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SliverToBoxAdapter for static content
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GlobalText(
                    str: """
সম্মানিত পাঠক-পাঠিকা আমাদের এই অ্যাপটি আপনাদের সেবাই তৈরি করেছি। আমরা আপ্রাণ চেষ্টা করি নিরবচ্ছিন্ন সেবা দিতে। তারপরও যদি কোন সমস্যা আপনাদের চোখে পড়ে অনুগ্রহপূর্বক আমাদের ফেসবুক পেজে ম্যাসেজ করে জানাবেন। আমরা সমাধান করবো। ইন-শাহ-আল্লাহ
সম্মানিত পাঠক-পাঠিকা অ্যাপটি যদি আপনাদের কাছে ভাল লাগে তাহলে প্লে স্টরে গিয়ে ৫ ***** স্টার  রেটিং দিয়ে সুন্দর একটি কমেন্ট করবেন সে আশাবাদী আপনাদের কাছে।


আমাদের ফেসবুক পেজের লিঙ্ক -
""",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  GlobalText(
                    str: "www.facebook.com/FlutterBangla",
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  GlobalText(
                    str: "www.flutterbangla.blogspot.com",
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    fontSize: 18,
                    color: ColorRes.appColor,
                  ),
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
