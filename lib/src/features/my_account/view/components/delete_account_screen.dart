
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_bottom_widget.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../global/widget/global_textform_field.dart';

class DeleteYourAccountScreen extends StatefulWidget {
  const DeleteYourAccountScreen({super.key});

  @override
  State<DeleteYourAccountScreen> createState() => _DeleteYourAccountScreenState();
}

class _DeleteYourAccountScreenState extends State<DeleteYourAccountScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final oldPasswordCon = TextEditingController();
  final confirmCon = TextEditingController();
  bool isDeleteEnabled = false;

  @override
  void initState() {
    super.initState();
    confirmCon.addListener(() {
      setState(() {
        isDeleteEnabled = confirmCon.text.toUpperCase() == 'DELETE';
      });
    });
  }

  @override
  void dispose() {
    confirmCon.dispose();
    oldPasswordCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorRes.appNavyColor.withOpacity(0.9),
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
                sizedBoxH(20),
                const GlobalText(
                  str: "Delete Your Account",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                sizedBoxH(20),
                const GlobalText(
                  str: "Are you sure you want to delete your account? This action cannot be undone. Please confirm your decision below.",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                sizedBoxH(15),
                GlobalTextFormField(
                  titleText: "Confirm",
                  controller: confirmCon,
                  hintText: "Type 'DELETE' to confirm",
                  filled: true,
                  fillColor: ColorRes.listTileBackColor,
                  isDense: true,
                ),
                sizedBoxH(30),
                GlobalButtonWidget(
                  str: "DELETE",
                  height: 40,
                  textSize: 13,
                  buttomColor: isDeleteEnabled ? ColorRes.appCeruleanColor : ColorRes.grey,
                  imgColor: ColorRes.white,
                  onTap: (){},
                ),

                sizedBoxH(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}