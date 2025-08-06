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
            GlobalText(
              str: "📖 আমাদের সম্পর্কে",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              fontFamily: 'Rubik',
              color: ColorRes.appColor,
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
                        """ "Dadar i School" একটি শিক্ষামূলক ও বিনোদনমূলক অ্যাপ, যেখানে ছোটদের জন্য মজার ছড়া ও সুন্দর কবিতার সংগ্রহ রয়েছে। শিশুরা যাতে আনন্দের সাথে ছড়া ও কবিতা পড়তে পারে এবং সহজেই শিখতে পারে, সেই লক্ষ্যেই এই অ্যাপটি তৈরি করা হয়েছে।

আমাদের অ্যাপে বিভিন্ন ধরনের বাংলা ছড়া ও কবিতা রয়েছে—যেমন মজার ছড়া, শিক্ষামূলক কবিতা, রঙিন প্রকৃতি, নৈতিক শিক্ষা এবং কল্পনার জগৎ নিয়ে লেখা ছড়াগুলো। প্রতিটি ছড়া ও কবিতাকে সুন্দরভাবে উপস্থাপন করা হয়েছে, যাতে শিশুরা সহজেই আকৃষ্ট হয় এবং বাংলা ভাষার প্রতি ভালোবাসা গড়ে তুলতে পারে।

আমরা বিশ্বাস করি, ছড়া ও কবিতার মাধ্যমে শিশুরা শুধু ভাষার সৌন্দর্যই উপভোগ করবে না, বরং সৃজনশীলতা ও কল্পনাশক্তির বিকাশ ঘটবে। এই অ্যাপটি বাবা-মা, শিক্ষক এবং অভিভাবকদের জন্যও সহায়ক, কারণ তারা ছোটদের জন্য উপযুক্ত ছড়া ও কবিতা সহজেই পেয়ে যাবেন।

📌 আমাদের বৈশিষ্ট্যসমূহ:
✅ বাংলা ভাষায় শিশুদের জন্য মনোমুগ্ধকর ছড়া ও কবিতা
✅ সহজ ও আকর্ষণীয় ডিজাইন
✅ নতুন নতুন ছড়া ও কবিতা নিয়মিত সংযোজন
✅ শিশুদের শিক্ষামূলক ও আনন্দদায়ক অভিজ্ঞতা

আপনার ছোট্ট সোনামণির জন্য "Dadar i School" অ্যাপটি উপভোগ করুন এবং তাদের আনন্দের সঙ্গে শেখার সুযোগ করে দিন! 💖
                        """,
                    fontSize: 15,
                    color: ColorRes.black,
                    textAlign: TextAlign.justify,
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
