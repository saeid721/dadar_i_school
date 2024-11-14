
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

class HomeSectionMoviePosterWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionMoviePosterWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionMoviePosterWidget> createState() => _HomeSectionMoviePosterWidgetState();
}

class _HomeSectionMoviePosterWidgetState extends State<HomeSectionMoviePosterWidget> {

  @override
  Widget build(BuildContext context) {
    final langCodeId = locator<LocalStorage>().getString(key: StorageKeys.langCodeId);
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    final trailerList = widget.homeSectionData?.movie?.trailers?.where((trailer) => trailer.languageId.toString() == langCodeId).toList();
    final genres = widget.homeSectionData?.movie?.genres?.where((trailer) => trailer.id.toString() == langCodeId).toList();

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
                initImg: "${widget.homeSectionData?.movie?.thumbnail}",
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
                      enText: widget.homeSectionData?.movie?.title ?? "",
                      bnText: widget.homeSectionData?.movie?.titleBn ?? "",
                      hiText: widget.homeSectionData?.movie?.titleHi ?? "",
                      arText: widget.homeSectionData?.movie?.titleAr ?? "",
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  GlobalText(
                    str: DateTimeFormatter.showYear.format(DateTime.parse(widget.homeSectionData?.movie?.releaseDate ?? "")),
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
                        enText: widget.homeSectionData?.movie?.description ?? "",
                        bnText: widget.homeSectionData?.movie?.descriptionBn ?? "",
                        hiText: widget.homeSectionData?.movie?.descriptionHi ?? "",
                        arText: widget.homeSectionData?.movie?.descriptionAr ?? "",
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
