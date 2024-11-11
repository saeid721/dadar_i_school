
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/utils/show_toast.dart';
import '../../../../global/widget/global_bottom_widget.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textform_field.dart';
import '../../controller/my_account_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController firstNameCon = TextEditingController();
  TextEditingController lastNameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();

  final myAccountController = Get.find<MyAccountController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUpdateData();
  }

  initUpdateData(){
    firstNameCon = TextEditingController(text: myAccountController.subscriberMeModel?.data?.firstName ?? "");
    lastNameCon = TextEditingController(text: myAccountController.subscriberMeModel?.data?.lastName ?? "");
    emailCon = TextEditingController(text: myAccountController.subscriberMeModel?.data?.email ?? "");
    phoneCon = TextEditingController(text: myAccountController.subscriberMeModel?.data?.phone ?? "");
    addressCon = TextEditingController(text: myAccountController.subscriberMeModel?.data?.address ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAccountController>(builder: (myAccountController){
      return AlertDialog(
        backgroundColor: ColorRes.appBackColor.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        content: SizedBox(
          width: Get.width,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [

                  sizedBoxH(10),
                  SizedBox(
                    height: 30, width: size(context).width,
                    child: Stack(
                      children: [
                        const Center(
                          child: GlobalText(
                            str: "Edit Profile",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: const GlobalImageLoader(
                              imagePath: Images.close,
                              height: 22,
                              width: 22,
                              color: ColorRes.appRedColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  sizedBoxH(10),
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
                  GlobalTextFormField(
                    controller: firstNameCon,
                    titleText: 'First Name',
                    filled: true,
                    fillColor: ColorRes.listTileBackColor,
                    isDense: true,
                  ),

                  sizedBoxH(10),
                  GlobalTextFormField(
                    controller: lastNameCon,
                    titleText: 'Last Name',
                    filled: true,
                    fillColor: ColorRes.listTileBackColor,
                    isDense: true,
                  ),

                  sizedBoxH(10),
                  GlobalTextFormField(
                    controller: emailCon,
                    titleText: 'Email',
                    filled: true,
                    fillColor: ColorRes.listTileBackColor,
                    isDense: true,
                  ),

                  sizedBoxH(10),
                  GlobalTextFormField(
                    controller: phoneCon,
                    titleText: 'Phone',
                    filled: true,
                    fillColor: ColorRes.listTileBackColor,
                    isDense: true,
                  ),

                  sizedBoxH(8),
                  GlobalTextFormField(
                    controller: addressCon,
                    titleText: 'Address',
                    filled: true,
                    fillColor: ColorRes.listTileBackColor,
                    isDense: true,
                  ),

                  sizedBoxH(30),
                  GlobalButtonWidget(
                    str: "Update",
                    height: 40,
                    buttomColor: ColorRes.appRedColor,
                    radius: 8,
                    textSize: 13,
                    onTap: () async{
                      if(firstNameCon.text.isNotEmpty){
                        if(lastNameCon.text.isNotEmpty){
                          if(emailCon.text.isNotEmpty){
                            if(phoneCon.text.isNotEmpty){
                              if(addressCon.text.isNotEmpty){
                                await Get.showOverlay(
                                  loadingWidget: const OverlayLoadingIndicator(),
                                  asyncFunction: () async {
                                    await myAccountController.updateSubscribersMe(
                                      firstName: firstNameCon.text.trim(),
                                      lastName: lastNameCon.text.trim(),
                                      email: emailCon.text.trim(),
                                      phone: phoneCon.text.trim(),
                                      address: addressCon.text.trim(),
                                      stateChange: (){
                                        Navigator.pop(context);
                                        firstNameCon.clear();
                                        lastNameCon.clear();
                                        emailCon.clear();
                                        phoneCon.clear();
                                        addressCon.clear();
                                      },
                                    );
                                  },
                                );

                              } else{
                                showCustomSnackBar("Address is Required", icon: Icons.info);
                              }

                            } else{
                              showCustomSnackBar("Phone is Required", icon: Icons.info);
                            }

                          } else{
                            showCustomSnackBar("Email is Required", icon: Icons.info);
                          }

                        } else{
                          showCustomSnackBar("Last Name is Required", icon: Icons.info);
                        }
                      } else{
                        showCustomSnackBar("First Name is Required", icon: Icons.info);
                      }
                    },
                  ),

                  sizedBoxH(20),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}