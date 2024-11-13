
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/account/view/widget/account_menu_widget.dart';
import 'package:dadar_i_school/src/features/my_account/view/my_account_screen.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/constants/images.dart';
import 'package:dadar_i_school/src/global/widget/global_bottom_widget.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/service/auth/controller/auth_controller.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../global/utils/show_toast.dart';
import '../../../global/widget/dotted/global_dotted_line_painter.dart';
import '../../../global/widget/global_text.dart';
import '../../../initializer.dart';
import '../../../service/auth/view/auth_screen.dart';
import '../../dashboard_bottom_navigation_bar/controller/dashboard_buttom_controller.dart';
import '../../my_account/controller/my_account_controller.dart';
import 'language_select_screen.dart';
import 'subscribe_now_screen.dart';
import 'watch_list_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if(accessToken != null){
        MyAccountController.current.getSubscribersMe();
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    final langCodeName = locator<LocalStorage>().getString(key: StorageKeys.langCodeName);
    final String? accessToken = locator<LocalStorage>().getString(key: StorageKeys.accessToken);

    log("Access Token: $accessToken");
    log("Saved Lang Name: $langCodeName");
    return GetBuilder<AuthController>(builder: (authController){
      return GetBuilder<DashboardBottomController>(builder: (dashboardBottomController){
        return GetBuilder<MyAccountController>(builder: (myAccountController){
          final subscriberMeData = myAccountController.subscriberMeModel?.data;

          return Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            body: GlobalContainer(
              height: size(context).height,
              width: size(context).width,
              color: ColorRes.appBackColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH(40),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: GlobalText(
                      str: "Dadar i School",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  accessToken != null ?
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> const MyAccountScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: ColorRes.white
                                ),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const GlobalImageLoader(
                              imagePath: Images.logInIc,
                              color: ColorRes.white,
                            ),
                          ),
                          sizedBoxW(10),
                          Expanded(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      str: "${subscriberMeData?.firstName} ${subscriberMeData?.lastName}",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    GlobalText(
                                      str: subscriberMeData?.phone ?? "",
                                      fontSize: 13,
                                      color: ColorRes.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              )
                          ),
                          const Icon(Icons.arrow_forward_ios,
                            color: ColorRes.grey,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ) : const SizedBox.shrink(),

                  sizedBoxH(10),
                  GlobalButtonWidget(
                    str: "Subscribe Now",
                    height: 45,
                    buttomColor: ColorRes.appRedColor,
                    textSize: 13,
                    onTap: (){
                      Get.to(()=> const SubscribeNowScreen());
                    },
                  ),

                  accessToken == null ? sizedBoxH(10) : const SizedBox.shrink(),
                  accessToken == null ?
                  GlobalButtonWidget(
                    str: "Login / Sign Up",
                    img: Images.logInIc,
                    height: 50,
                    textSize: 13,
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (ctx){
                            return const AuthScreen();
                          }
                      );
                    },
                  ) : const SizedBox.shrink(),

                  sizedBoxH(20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorRes.listTileBackColor
                    ),
                    child: Column(
                      children: [

                        // AccountMenuWidget(
                        //     img: Images.languageIc,
                        //     title: "App Language",
                        //     subTitle: langCodeName ?? 'English',
                        //     onTap: (){
                        //       showModalBottomSheet(
                        //           context: context,
                        //           backgroundColor: Colors.transparent,
                        //           builder: (ctx){
                        //             return const LanguageSelectScreen();
                        //           }
                        //       );
                        //     }
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 1),
                            painter: GlobalDottedLinePainter(),
                          ),
                        ),

                        // AccountMenuWidget(
                        //     img: Images.watchIc,
                        //     title: "Watch List",
                        //     onTap: (){
                        //       //Get.to(()=> const WatchListScreen());
                        //     }
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 1),
                            painter: GlobalDottedLinePainter(),
                          ),
                        ),

                        // AccountMenuWidget(
                        //     img: Images.downloadIc,
                        //     title: "Download",
                        //     onTap: (){
                        //       dashboardBottomController.onItemTapped(2);
                        //     }
                        // ),
                        sizedBoxH(5)

                      ],
                    ),
                  ),

                  sizedBoxH(20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorRes.listTileBackColor
                    ),
                    child: Column(
                      children: [

                        // AccountMenuWidget(
                        //     img: Images.billingHistoryIc,
                        //     title: "Billing History",
                        //     onTap: (){
                        //       accessToken == null
                        //           ? showDialog(
                        //           context: context,
                        //           builder: (ctx){
                        //             return const AuthScreen();
                        //           })
                        //           : showCustomSnackBar("Billing History", icon: Icons.info);
                        //     }
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 1),
                            painter: GlobalDottedLinePainter(),
                          ),
                        ),

                        // AccountMenuWidget(
                        //     img: Images.activatedTvIc,
                        //     title: "Activate TV",
                        //     onTap: (){
                        //       accessToken == null
                        //           ? showDialog(
                        //           context: context,
                        //           builder: (ctx){
                        //             return const AuthScreen();
                        //           })
                        //           : showCustomSnackBar("Activate TV", icon: Icons.info);
                        //     }
                        // ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width, 1),
                            painter: GlobalDottedLinePainter(),
                          ),
                        ),

                        // AccountMenuWidget(
                        //     img: Images.deviceManagementIc,
                        //     title: "Device Management",
                        //     subTitle: "View All Registered Device",
                        //     onTap: (){
                        //       accessToken == null
                        //           ? showDialog(
                        //           context: context,
                        //           builder: (ctx){
                        //             return const AuthScreen();
                        //           })
                        //           : showCustomSnackBar("Device Management", icon: Icons.info);
                        //     }
                        // ),

                        sizedBoxH(5),

                      ],
                    ),
                  ),


                ],
              ),
            ),
          );
        });
      });
    });
  }
}
