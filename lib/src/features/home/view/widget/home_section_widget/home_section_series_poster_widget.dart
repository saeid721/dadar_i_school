
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../domain/server/http_client/app_config.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/date_time_formatter.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../video_player_widget.dart';

class HomeSectionSeriesPosterWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionSeriesPosterWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionSeriesPosterWidget> createState() => _HomeSectionSeriesPosterWidgetState();
}

class _HomeSectionSeriesPosterWidgetState extends State<HomeSectionSeriesPosterWidget> {

  @override
  Widget build(BuildContext context) {
    final langCodeId = locator<LocalStorage>().getString(key: StorageKeys.langCodeId);
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    final trailerList = widget.homeSectionData?.season?.trailers?.where((trailer) => trailer.languageId.toString() == langCodeId).toList();
    final genres = widget.homeSectionData?.series?.genres?.where((trailer) => trailer.id.toString() == langCodeId).toList();

    return GetBuilder<HomePageController>(builder: (homePageController){
      return trailerList?.isNotEmpty ?? false ? Column(
        children: [
          sizedBoxH(20),

          ListView.builder(
            itemCount: trailerList?.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              final trailer = trailerList?[index];

              return VideoPlayerWidget(
                videoSrc: "${AppConfig.base.url}${trailer?.url}",
                initImg: "${widget.homeSectionData?.series?.thumbnail}",
              );
            },
          ),

          sizedBoxH(10),
          Container(
              width: size(context).width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: widget.homeSectionData?.series?.title ?? "",
                      bnText: widget.homeSectionData?.series?.titleBn ?? "",
                      hiText: widget.homeSectionData?.series?.titleHi ?? "",
                      arText: widget.homeSectionData?.series?.titleAr ?? "",
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  GlobalText(
                    str: DateTimeFormatter.showYear.format(DateTime.parse(widget.homeSectionData?.season?.releaseDate ?? "")),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        str: "Genres: ",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorRes.appCeruleanColor,
                      ),

                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: genres?.length ?? 0,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {

                              return GlobalText(
                                str: "${genres?[index].name}",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  sizedBoxH(10),
                  SizedBox(
                    child: GlobalText(
                      str: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: widget.homeSectionData?.series?.description ?? "",
                        bnText: widget.homeSectionData?.series?.descriptionBn ?? "",
                        hiText: widget.homeSectionData?.series?.descriptionHi ?? "",
                        arText: widget.homeSectionData?.series?.descriptionAr ?? "",
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      fontSize: 13,
                    ),
                  )
                ],
              )
          ),

        ],
      ) : const SizedBox.shrink();
    });
  }
}
