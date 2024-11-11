
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage.dart';
import 'package:dadar_i_school/src/domain/local/preferences/local_storage_keys.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/global/widget/global_text.dart';
import 'package:dadar_i_school/src/initializer.dart';
import 'package:dadar_i_school/src/service/language_check/language_check.dart';
import '../../../global/widget/global_appbar.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../account/controller/account_controller.dart';

class SubscribeNowScreen extends StatefulWidget {
  const SubscribeNowScreen({
    super.key,
  });
  @override
  State<SubscribeNowScreen> createState() => _SubscribeNowScreenState();
}

class _SubscribeNowScreenState extends State<SubscribeNowScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectPlan = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AccountController.current.getSubscriptionsPlanList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          child: Column(
            children: [

              // ==# App Bar
              const GlobalAppbarWidget(
                title: "Plans",
              ),

              Expanded(
                child: SizedBox(
                  width: size(context).width,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              sizedBoxH(10),
                              const GlobalImageText(
                                str: "Subscribe to NP",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),

                              const GlobalText(
                                str: "Choose a plan to get started.",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: ColorRes.grey,
                              ),

                              sizedBoxH(10),
                              GridView.builder(
                                  itemCount: accountController.subscriptionsPlanListModel?.data?.length ?? 0,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: size(context).height < 700 ? 0.6 : 0.9,
                                  ),
                                  itemBuilder: (ctx, index){
                                    final subscribePlan = accountController.subscriptionsPlanListModel?.data?[index];
                                    return Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectPlan = index;
                                            });
                                          },
                                          child: Container(
                                            width: 200,
                                            padding: const EdgeInsets.all(3),
                                            margin: const EdgeInsets.only(
                                              right: 10,
                                              bottom: 10
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: selectPlan == index
                                                    ? ColorRes.appRedColor
                                                    : ColorRes.white
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                      width: selectPlan == index
                                                          ? 2
                                                          : 1,
                                                      color: selectPlan == index
                                                          ? ColorRes.white
                                                          : ColorRes.appRedColor
                                                  )
                                              ),
                                              child: Column(
                                                children: [

                                                  sizedBoxH(5),
                                                  GlobalText(
                                                    str: LanguageCheck.checkLanguage(
                                                        langCode: langCode,
                                                        enText: subscribePlan?.name ?? "",
                                                        bnText: subscribePlan?.nameBn ?? "",
                                                        hiText: subscribePlan?.nameHi ?? "",
                                                        arText: subscribePlan?.nameAr ?? "",
                                                    ),
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: selectPlan == index
                                                        ? ColorRes.white
                                                        : ColorRes.appRedColor
                                                  ),

                                                  sizedBoxH(10),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      sizedBoxW(5),
                                                      Container(
                                                        height: 12,
                                                        width: 12,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(50),
                                                            color: selectPlan == index
                                                                ? ColorRes.white
                                                                : ColorRes.appRedColor
                                                        ),
                                                        child: Icon(
                                                          Icons.check,
                                                          color: selectPlan == index
                                                              ? ColorRes.appRedColor
                                                              : ColorRes.white,
                                                          size: 10,
                                                        ),
                                                      ),

                                                      sizedBoxW(5),
                                                      Expanded(
                                                        child: SizedBox(
                                                          child: GlobalText(
                                                              str: LanguageCheck.checkLanguage(
                                                                  langCode: langCode,
                                                                  enText: subscribePlan?.description ?? "",
                                                                  bnText: subscribePlan?.descriptionBn ?? "",
                                                                  hiText: subscribePlan?.descriptionHi ?? "",
                                                                  arText: subscribePlan?.descriptionAr ?? ""
                                                              ),
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w400,
                                                              color: selectPlan == index
                                                                  ? ColorRes.white
                                                                  : ColorRes.appRedColor
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  sizedBoxH(10),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 8
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                                color: selectPlan == index
                                                    ? ColorRes.white
                                                    : ColorRes.appRedColor
                                            ),
                                            child: GlobalText(
                                              str: "Price: ${subscribePlan?.price}",
                                              color: selectPlan == index
                                                  ? ColorRes.appRedColor
                                                  : ColorRes.white,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }
                              ),

                            ],
                          ),
                        ),
                      ),

                      sizedBoxH(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GlobalButtonWidget(
                          str: "Continue With Standard Plan",
                          height: 45,
                          buttomColor: ColorRes.appRedColor,
                          textSize: 13,
                          onTap: () async{
                            await accountController.postSubscriptionEnroll(planId: '1');
                          },
                        ),
                      ),
                      sizedBoxH(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
