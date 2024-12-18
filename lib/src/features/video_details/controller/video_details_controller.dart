import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../account/controller/account_controller.dart';
import '../view/mini_screen_video_player.dart';
import '../view/components/video_details_play_back_speed_screen.dart';
import 'video_deatils_repo.dart';
import 'package:http/http.dart' as http;

class VideoDetailsController extends GetxController implements GetxService {
  static VideoDetailsController get current => Get.find();
  final VideoDetailsRepository repository = VideoDetailsRepository();
  final accountController = AccountController.current;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasError = false;

  bool get hasError => _hasError;

  List<String> shimmerList = ["", "", "", "", ""];

  /// ==# Selected Video Quantity..
  int? selectQuantity = 0;

  List<VideoQuality> qualityList = [];

  Future<List<VideoQuality>> fetchHlsQualities(String playlistUrl) async {
    try {
      // Clear the quality list before fetching new data
      qualityList.clear();

      final response = await http.get(Uri.parse(playlistUrl));

      if (response.statusCode == 200) {
        String playlistContent = response.body;

        // Split the playlist content into lines
        List<String> lines = playlistContent.split('\n');

        // Process each line to find variant qualities
        for (var line in lines) {
          if (line.contains('RESOLUTION')) {
            // Extract the resolution and bitrate details
            final resolution = _extractResolution(line);
            final bitrate = _extractBitrate(line);
            final url = _extractUrl(line, playlistUrl); // Handle relative URLs

            log("Video Quality: Resolution - $resolution, URL - $url");
            qualityList.add(VideoQuality(bitrate: bitrate, resolution: resolution, url: url));
          }
        }

        return qualityList;
      } else {
        throw Exception('Failed to load HLS playlist');
      }
    } catch (e) {
      log('Error fetching HLS playlist: $e');
      return [];
    }
  }

  String _extractResolution(String line) {
    // Extract the resolution from the line, e.g., 1280x720, and return only the height with "p"
    String resolution = line.split('RESOLUTION=')[1].split(',')[0];
    String height = resolution.split('x')[1]; // Extract the second part (height)
    return '${height}p'; // Return it with the "p" suffix
  }

  int _extractBitrate(String line) {
    // Extract bitrate from the line, e.g., 1200000
    return int.parse(line.split('BANDWIDTH=')[1].split(',')[0]);
  }

  String _extractUrl(String line, String baseUrl) {
    // Extract the URL for the variant stream, ensure it handles relative URLs
    if (line.contains('http')) {
      return line.trim();
    } else {
      return '$baseUrl/$line'.replaceAll('\n', '');
    }
  }

  /// ==================== /@ Business Logic @/ ====================

  OverlayEntry? _miniPlayerOverlay;

  void showMiniPlayerOverlay({required BuildContext context, required VideoPlayerController controller}) {
    if (_miniPlayerOverlay == null) {
      _miniPlayerOverlay = OverlayEntry(
        builder: (context) => Stack(
          children: [
            MiniScreenVideoPlayer(controller: controller),
          ],
        ),
      );
      Overlay.of(context).insert(_miniPlayerOverlay!);
    }
    update();
  }

  void removeMiniPlayerOverlay() {
    _miniPlayerOverlay?.remove();
    _miniPlayerOverlay = null;
    update();
  }

  /// ==# Next & Previous Button 10s Message View..

  String displayMessage = '';
  bool isMessageVisible = false;

  int clickCount = 0;
  Timer? _clickTimer;

  // Update this method to handle click counts
  void handleClick(bool isNext) {
    clickCount++;
    _showMessageWithCount(isNext);

    // Reset the click count after 3 seconds
    if (_clickTimer?.isActive ?? false) {
      _clickTimer!.cancel();
    }
    _clickTimer = Timer(const Duration(seconds: 2), () {
      clickCount = 0; // Reset the count
    });
  }

  void _showMessageWithCount(bool isNext) {
    int totalSeconds = 0 + clickCount * 10; // Calculate total seconds
    String direction = isNext ? 'Forward' : 'Rewind';
    showMessage('$direction $totalSeconds seconds');
  }

  void showMessage(String message) {
    displayMessage = message;
    isMessageVisible = true;
    update();

    Future.delayed(const Duration(seconds: 1), () {
      isMessageVisible = false;
      update();
      Future.delayed(const Duration(seconds: 1), () {
        displayMessage = '';
        update();
      });
    });
  }

  /// ==# Video Time Format..
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  /// ==# Selected Video Player Speed..
  int? selectPlaySpeed = 0;
  double? initialSpeed;

  List<PlayBackSpeedModel> playSpeedList = [
    PlayBackSpeedModel(playBackName: "0.5x", playBackValue: 0.5),
    PlayBackSpeedModel(playBackName: "0.75x", playBackValue: 0.75),
    PlayBackSpeedModel(playBackName: "Normal", playBackValue: 1.0),
    PlayBackSpeedModel(playBackName: "1.25x", playBackValue: 1.25),
    PlayBackSpeedModel(playBackName: "1.5x", playBackValue: 1.5),
    PlayBackSpeedModel(playBackName: "1.75x", playBackValue: 1.75),
    PlayBackSpeedModel(playBackName: "2x", playBackValue: 2.0),
    PlayBackSpeedModel(playBackName: "4x", playBackValue: 4.0)
  ];

  String getPlaybackSpeedLabel(double speed) {
    if (speed == 1.0) return 'Normal';
    return '${speed}x';
  }

  /// ==# Function to handle exit full-screen and reset to portrait mode..
  void exitFullScreen() {
    Get.back();
    // Reset to portrait mode when exiting full-screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);

    update();
  }
}

class VideoQuality {
  final int bitrate;
  final String resolution;
  final String url;

  VideoQuality({
    required this.bitrate,
    required this.resolution,
    required this.url,
  });
}
