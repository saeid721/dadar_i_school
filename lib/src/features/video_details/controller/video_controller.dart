import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoController {
  YoutubePlayerController? youtubePlayerController;
  VideoPlayerController? videoPlayerController;

  void initializeYoutubeController(String youtubeLink) {
    String? videoId = YoutubePlayer.convertUrlToId(youtubeLink);
    if (videoId != null) {
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
    }
  }

  void initializeVideoPlayerController(String videoLink) {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoLink));
  }

  Widget buildYoutubePlayer() {
    if (youtubePlayerController != null) {
      return YoutubePlayer(controller: youtubePlayerController!);
    } else {
      return const Center(
        child: Text(
          'Invalid YouTube video link',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void dispose() {
    youtubePlayerController?.dispose();
    videoPlayerController?.dispose();
  }
}

