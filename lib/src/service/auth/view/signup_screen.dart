
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/utils/show_toast.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_couple_text_button.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../../global/widget/global_textform_field.dart';
import '../controller/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onSwitch;
  const SignUpScreen({
    super.key,
    required this.onSwitch
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController phoneCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  TextEditingController confirmPassCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController){
      return Column(
        children: [
          sizedBoxH(10),
          SizedBox(
            height: 30, width: size(context).width,
            child: Stack(
              children: [
                const Center(
                  child: GlobalText(
                    str: "Sign Up",
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
                      color: ColorRes.appCeruleanColor,
                    ),
                  ),
                )
              ],
            ),
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
            controller: passCon,
            titleText: 'Password',
            filled: true,
            fillColor: ColorRes.listTileBackColor,
            isDense: true,
            isPasswordField: true,
          ),

          sizedBoxH(8),
          GlobalTextFormField(
            controller: confirmPassCon,
            titleText: 'Confirm Password',
            filled: true,
            fillColor: ColorRes.listTileBackColor,
            isDense: true,
            isPasswordField: true,
          ),

          sizedBoxH(30),
          GlobalButtonWidget(
            str: "Sign Up",
            height: 40,
            buttomColor: ColorRes.appCeruleanColor,
            radius: 8,
            textSize: 13,
            onTap: () async{
              if(phoneCon.text.isNotEmpty){
                if(passCon.text.isNotEmpty){
                  if(passCon.text == confirmPassCon.text){
                    await Get.showOverlay(
                      loadingWidget: const OverlayLoadingIndicator(),
                      asyncFunction: () async {
                        await authController.reqRegistration(
                            phone: phoneCon.text.trim(),
                            password: passCon.text.trim(),
                            stateChange: widget.onSwitch
                        );
                      },
                    );
                  } else{
                    showCustomSnackBar("Password Not Match!", icon: Icons.info);
                  }
                } else{
                  showCustomSnackBar("Password is Required", icon: Icons.info);
                }
              } else{
                showCustomSnackBar("Email is Required", icon: Icons.info);
              }

            },
          ),

          sizedBoxH(10),
          GestureDetector(
            onTap: widget.onSwitch,
            child: const Align(
              alignment: Alignment.center,
              child: CoupleTextButton(
                  firstText: "Already have a account? ",
                  secondText: "Log In"
              ),
            ),
          ),

          sizedBoxH(30),

        ],
      );
    });
  }
}