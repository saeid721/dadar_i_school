
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:dadar_i_school/src/domain/server/http_client/app_config.dart';
import 'package:dadar_i_school/src/global/utils/show_toast.dart';
import 'package:path_provider/path_provider.dart';
import '../../account/controller/account_controller.dart';
import '../../video_details/view/local_movie_video_details_screen.dart';
import 'download_repo.dart';

class DownloadController extends GetxController implements GetxService {
  static DownloadController get current => Get.find();
  final DownloadRepository repository = DownloadRepository();
  final accountController = AccountController.current;

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // bool _hasError = false;
  // bool get hasError => _hasError;

  double progress = 0.0;
  String? videoFilePath;
  String? imgFilePath;

  // List to hold downloaded videos locally
  List<LocalMovieVideoModel> downloadedVideos = [];

  Future<void> downloadAndSaveVideo({required LocalMovieVideoModel localMovieVideoModel}) async {
    try {
      final Directory? downloadsDir = await getDownloadsDirectory();

      if (downloadsDir != null) {
        String saveDir = downloadsDir.path;
        await Directory(saveDir).create(recursive: true);
        String savePath = '$saveDir/movie/${localMovieVideoModel.videoSrc.split('/').last}';

        // Construct full download URL
        String downloadUrl = "${AppConfig.base.url}${localMovieVideoModel.videoSrc}";
        log("Video Download URL: $downloadUrl");
        log("Local Save Path: $savePath");

        await repository.requestHandler.dio.download(
          downloadUrl,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              progress = (received / total * 100);
              update();
            }
          },
        );

        // Update local video path
        videoFilePath = savePath;

        // Save video data to Hive
        final box = await Hive.openBox<List<dynamic>>('videos');
        localMovieVideoModel = localMovieVideoModel.copyWith(videoSrc: savePath);
        downloadedVideos.add(localMovieVideoModel);
        box.put('video_list', downloadedVideos.map((e) => e.toMap()).toList());

        showCustomSnackBar("Video Downloaded & Saved Successfully");
        update();
      } else {
        showCustomSnackBar("Error: Unable to access download directory.");
      }
    } catch (e, s) {
      log("Error downloading and saving video: $e", error: e, stackTrace: s);
      showCustomSnackBar("Error downloading and saving video: $e");
    }
  }


  // Load videos from Hive
  Future<void> loadDownloadedVideos() async {
    final box = await Hive.openBox<List<dynamic>>('videos');
    final videoListData = box.get('video_list');

    if (videoListData != null) {
      downloadedVideos = videoListData.map((data) {
        final mapData = Map<String, dynamic>.from(data as Map);
        return LocalMovieVideoModel.fromMap(mapData);
      }).toList();
    }

    update();
  }

  // Updated `getVideoPlayer()` method to select a specific video from the list
  Future<void> getVideoPlayer({required int index}) async {
    if (index >= 0 && index < downloadedVideos.length) {
      final video = downloadedVideos[index];
      log("Video Path 0: ${video.videoSrc}");
      log("Image Path 0: ${video.initImg}");
      final videoFile = File(video.videoSrc);
      final imgFile = File(video.initImg);

      if (await videoFile.exists()) {
        videoFilePath = videoFile.path;
        imgFilePath = imgFile.path;
        log("Video Path 1: $videoFilePath");
        log("Image Path 1: $imgFilePath");
        update();

        // Get.to(() => LocalMovieVideoDetailsScreen(
        //   videoSrc: videoFilePath!,
        //   initImg: imgFilePath!,
        //   isLocal: true,
        // ));
      } else {
        log("Error: Video file not found at ${video.videoSrc}");
        showCustomSnackBar("Error: Video file not found.");
      }
    }
  }

}

class LocalMovieVideoModel {
  final String videoSrc;
  final String initImg;
  final String videoName;

  LocalMovieVideoModel({
    required this.videoSrc,
    required this.initImg,
    required this.videoName,
  });

  LocalMovieVideoModel copyWith({
    String? videoSrc,
    String? initImg,
    String? videoName,
  }) {
    return LocalMovieVideoModel(
      videoSrc: videoSrc ?? this.videoSrc,
      initImg: initImg ?? this.initImg,
      videoName: videoName ?? this.videoName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoSrc': videoSrc,
      'initImg': initImg,
      'videoName': videoName,
    };
  }

  factory LocalMovieVideoModel.fromMap(Map<String, dynamic> map) {
    return LocalMovieVideoModel(
      videoSrc: map['videoSrc'],
      initImg: map['initImg'],
      videoName: map['videoName'],
    );
  }
}