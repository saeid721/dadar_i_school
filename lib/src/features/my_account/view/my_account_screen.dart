
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/my_account/controller/my_account_controller.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_progress_hub.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/service/auth/controller/auth_controller.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/dotted/global_dotted_line_painter.dart';
import '../../../global/widget/global_appbar.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_text.dart';
import 'components/edit_profile_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});
  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      MyAccountController.current.getSubscribersMe();
    });

  }

  @override
  Widget build(BuildContext context) {
      return GetBuilder<MyAccountController>(builder: (myAccountController){
        final subscriberMeData = myAccountController.subscriberMeModel?.data;
        return Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: ProgressHUD(
            inAsyncCall: myAccountController.isLoading,
            child: GlobalContainer(
              height: size(context).height,
              width: size(context).width,
              color: ColorRes.appNavyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Container(
                      width: size(context).width,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            sizedBoxH(20),
                            Container(
                              height: 80,
                              width: 80,
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

                            sizedBoxH(10),
                            GlobalText(
                              str: subscriberMeData?.firstName ?? "",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),

                            GlobalText(
                              str: subscriberMeData?.phone ?? "",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.grey,
                            ),

                            sizedBoxH(20),
                            Container(
                              width: size(context).width,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: ColorRes.listTileBackColor,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const GlobalText(
                                          str: "Account Information",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const EditProfileScreen();
                                              },
                                            );
                                          },
                                          child: const Icon(Icons.edit,
                                              color: ColorRes.appCeruleanColor,
                                              size: 22
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  sizedBoxH(10),
                                  CustomPaint(
                                    size: Size(MediaQuery.of(context).size.width, 1),
                                    painter: GlobalDottedLinePainter(),
                                  ),

                                  sizedBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const GlobalText(
                                          str: "Full Name: ",
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: GlobalText(
                                            str: "${subscriberMeData?.firstName} ${subscriberMeData?.lastName}",
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizedBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const GlobalText(
                                          str: "Phone: ",
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: GlobalText(
                                            str: subscriberMeData?.phone ?? "",
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizedBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const GlobalText(
                                          str: "Mail: ",
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: GlobalText(
                                            str: subscriberMeData?.email ?? "",
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizedBoxH(10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const GlobalText(
                                          str: "Address: ",
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: GlobalText(
                                            str: subscriberMeData?.address ?? "",
                                            fontWeight: FontWeight.w400,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  sizedBoxH(10),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GlobalButtonWidget(
                      str: "Log Out",
                      img: Images.logOutIc,
                      height: 45,
                      textSize: 13,
                      buttomColor: ColorRes.appCeruleanColor,
                      imgColor: ColorRes.white,
                      onTap: () async{
                        //await authController.reqLogOut();
                      },
                    ),
                  ),
                  sizedBoxH(20)

                ],
              ),
            ),
          ),
        );
      });
    }
}
