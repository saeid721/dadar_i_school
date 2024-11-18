import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {
  YoutubePlayerController? youtubePlayerController;
  VideoPlayerController? videoPlayerController;

  List<Map<String, String>> playlist = [];
  int currentVideoIndex = 0;

  // Set playlist from data
  void setPlaylist(List<Map<String, String>> videos) {
    playlist = videos;
    currentVideoIndex = 0;
    _loadVideo();
  }

  // Load current video
  void _loadVideo() {
    if (playlist.isNotEmpty) {
      final videoLink = playlist[currentVideoIndex]['youtubeLink']!;
      if (videoLink.contains('youtube.com') || videoLink.contains('youtu.be')) {
        initializeYoutubeController(videoLink);
      } else {
        initializeVideoPlayerController(videoLink);
      }
      notifyListeners();
    }
  }

  void initializeYoutubeController(String youtubeLink) {
    String? videoId = YoutubePlayer.convertUrlToId(youtubeLink);
    if (videoId != null) {
      youtubePlayerController?.dispose();
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
    }
  }

  void initializeVideoPlayerController(String videoLink) {
    videoPlayerController?.dispose();
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoLink))
      ..initialize().then((_) {
        videoPlayerController!.play();
        notifyListeners();
      });
  }

  void playNext() {
    if (currentVideoIndex < playlist.length - 1) {
      currentVideoIndex++;
      _loadVideo();
    }
  }

  void playPrevious() {
    if (currentVideoIndex > 0) {
      currentVideoIndex--;
      _loadVideo();
    }
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

  void disposeControllers() {
    youtubePlayerController?.dispose();
    videoPlayerController?.dispose();
  }
}
