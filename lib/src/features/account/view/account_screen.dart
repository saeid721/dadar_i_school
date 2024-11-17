import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/constants/images.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../global/widget/dotted/global_dotted_line_painter.dart';
import '../../../global/widget/global_text.dart';
import '../../my_account/view/widget/account_menu_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: GlobalContainer(
        height: size(context).height,
        width: size(context).width,
        color: ColorRes.appNavyColor,
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
            sizedBoxH(20),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: ColorRes.listTileBackColor),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 1),
                      painter: GlobalDottedLinePainter(),
                    ),
                  ),
                  AccountMenuWidget(img: Images.watchIc, title: "Watch List", onTap: () {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 1),
                      painter: GlobalDottedLinePainter(),
                    ),
                  ),
                  sizedBoxH(5)
                ],
              ),
            ),
            sizedBoxH(20),
          ],
        ),
      ),
    );
  }
}
