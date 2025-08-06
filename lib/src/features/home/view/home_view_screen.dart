import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../drawer/view/custom_drawer_widget.dart';
import '../../../global/widget/global_progress_hub.dart';
import '../controller/home_controller.dart';
import 'beginner_spoken_english_see_all_screen/widget/beginner_spoken_english_widget.dart';
import 'english_grammar_course_see_all_screen/widget/english_grammar_course_widget.dart';
import 'widget/carousel_slider.dart';
import 'widget/global_sliver_app_bar_widget.dart';
import 'hundred_days_basic_english_see_all_screen/widget/hundred_days_basic_english_widget.dart';
import 'hundred_days_spoken_english_see_all_screen/widget/hundred_days_spoken_english_widget.dart';
import 'spoken_english_practice_see_all_screen/widget/spoken_english_practice_english_widget.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> with TickerProviderStateMixin {
  late final HomePageController homePageController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    homePageController = HomePageController.current;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        homePageController.getHundredDaysBasicEnglishList(),
        homePageController.getBeginnerSpokenEnglishList(),
        homePageController.getHundredDaysSpokenEnglishList(),
        homePageController.getSpokenEnglishPracticeList(),
        homePageController.getEnglishGrammarCourseList(),
      ]);
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          drawer: const CustomDrawerWidget(),
          body: ProgressHUD(
            inAsyncCall: controller.isLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                GlobalSliverAppBar(
                  backgroundColor: ColorRes.appColor,
                  backgroundWidget: buildCarouselSlider(),
                  title: "Dadar i School",
                  subtitle: "The English Learning School",
                  imageUrl: Images.appLogo,
                  titleColor: ColorRes.appColor,
                  subtitleColor: Colors.grey[600]!,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (ctx, index) {
                        return FadeTransition(
                          opacity: _fadeAnimation,
                          child: Transform.translate(
                            offset: Offset(0, 50 * (1 - _fadeAnimation.value)),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300 + (index * 100)),
                              curve: Curves.easeOutBack,
                              margin: const EdgeInsets.only(bottom: 25),
                              child: _buildModernSectionCard(controller, index),
                            ),
                          ),
                        );
                      },
                      childCount: controller.homeSectionList.length,
                    ),

                  ),
                ),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: Colors.amber[600],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Keep learning every day!",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildModernSectionCard(HomePageController controller, int index) {
    final sectionData = controller.homeSectionList[index];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionContent(sectionData),
        ],
      ),
    );
  }

  Widget _buildSectionContent(dynamic sectionData) {
    switch (sectionData.sectionType) {
      case "hundred_days_basic_english":
        return HundredDaysBasicEnglishWidget(id: sectionData.id);
      case "beginner_spoken_english":
        return BeginnerSpokenEnglishWidget(id: sectionData.id);
      case "hundred_days_spoken_english":
        return HundredDaysSpokenEnglishWidget(id: sectionData.id);
      case "spoken_english_practice":
        return SpokenEnglishPracticeWidget(id: sectionData.id);
      case "english_grammar_course":
        return EnglishGrammarCourseWidget(id: sectionData.id);
      default:
        return const SizedBox.shrink();
    }
  }
}