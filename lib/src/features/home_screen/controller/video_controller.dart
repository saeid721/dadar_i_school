import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  YoutubePlayerController? youtubePlayerController;
  VideoPlayerController? videoPlayerController;

  List<dynamic> playlist = [];
  int currentVideoIndex = 0;
  bool isInitialized = false;
  bool isLoading = false;
  String currentVideoType = '';
  String? currentVideoId;
  String? currentVideoTitle;
  String? currentVideoDescription;

  @override
  void onInit() {
    super.onInit();
  }

  // Initialize playlist and load first video
  void initializePlaylist(List<dynamic> videoList, {int initialIndex = 0}) {
    if (videoList.isEmpty) return;

    playlist = videoList;
    currentVideoIndex = initialIndex.clamp(0, videoList.length - 1);
    _updateCurrentVideoInfo();
    loadCurrentVideo();
  }

  // Find and set initial video by ID or link
  void setInitialVideo(List<dynamic> videoList, {String? videoId, String? youtubeLink, int? index}) {
    if (videoList.isEmpty) return;

    playlist = videoList;

    if (index != null && index >= 0 && index < videoList.length) {
      currentVideoIndex = index;
    } else if (videoId != null || youtubeLink != null) {
      currentVideoIndex = videoList.indexWhere((video) =>
      (videoId != null && video.id.toString() == videoId) ||
          (youtubeLink != null && video.youtubeLink == youtubeLink)
      );
      if (currentVideoIndex == -1) currentVideoIndex = 0;
    } else {
      currentVideoIndex = 0;
    }

    _updateCurrentVideoInfo();
    loadCurrentVideo();
  }

  // Update current video information
  void _updateCurrentVideoInfo() {
    if (playlist.isNotEmpty && currentVideoIndex >= 0 && currentVideoIndex < playlist.length) {
      final video = playlist[currentVideoIndex];
      currentVideoId = video?.id?.toString();
      currentVideoTitle = video?.title ?? '';
      currentVideoDescription = video?.shortDescription ?? '';
      update();
    }
  }

  // Load current video
  void loadCurrentVideo() {
    if (!_isValidIndex(currentVideoIndex)) return;

    _setLoadingState(true);
    final videoLink = playlist[currentVideoIndex]?.youtubeLink ?? "";

    if (videoLink.isEmpty) {
      _setLoadingState(false);
      return;
    }

    _disposeCurrentControllers();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (videoLink.contains('youtube.com') || videoLink.contains('youtu.be')) {
        _initializeYoutubePlayer(videoLink);
      } else {
        _initializeVideoPlayer(videoLink);
      }
    });
  }

  // Initialize YouTube player
  void _initializeYoutubePlayer(String youtubeLink) {
    try {
      final videoId = YoutubePlayer.convertUrlToId(youtubeLink);
      if (videoId == null) {
        _setLoadingState(false);
        return;
      }

      currentVideoType = 'youtube';
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
          captionLanguage: 'en',
          forceHD: false,
          startAt: 0,
        ),
      );

      youtubePlayerController!.addListener(_onYoutubePlayerStateChanged);

      // Fallback initialization
      Future.delayed(const Duration(seconds: 2), () {
        if (!isInitialized) {
          _setInitializedState(true);
        }
      });
    } catch (e) {
      _setLoadingState(false);
    }
  }

  // Initialize regular video player
  void _initializeVideoPlayer(String videoLink) {
    try {
      currentVideoType = 'video';
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoLink));

      videoPlayerController!.initialize().then((_) {
        _setInitializedState(true);
      }).catchError((error) {
        _setLoadingState(false);
      });
    } catch (e) {
      _setLoadingState(false);
    }
  }

  // YouTube player state change listener
  void _onYoutubePlayerStateChanged() {
    if (!isInitialized && youtubePlayerController!.value.isReady) {
      _setInitializedState(true);
    }
  }

  // Set loading state
  void _setLoadingState(bool loading) {
    isLoading = loading;
    isInitialized = false;
    update();
  }

  // Set initialized state
  void _setInitializedState(bool initialized) {
    isInitialized = initialized;
    isLoading = false;
    update();
  }

  // Switch to specific video
  void switchToVideo(int index) {
    if (!_isValidIndex(index) || index == currentVideoIndex) return;

    currentVideoIndex = index;
    _updateCurrentVideoInfo();
    loadCurrentVideo();
  }

  // Navigation controls
  void playNext() {
    if (hasNextVideo) {
      switchToVideo(currentVideoIndex + 1);
    }
  }

  void playPrevious() {
    if (hasPreviousVideo) {
      switchToVideo(currentVideoIndex - 1);
    }
  }

  // Play/Pause controls
  void togglePlayPause() {
    if (currentVideoType == 'youtube' && youtubePlayerController != null) {
      if (youtubePlayerController!.value.isPlaying) {
        youtubePlayerController!.pause();
      } else {
        youtubePlayerController!.play();
      }
    } else if (currentVideoType == 'video' && videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
      } else {
        videoPlayerController!.play();
      }
    }
    update();
  }

  // Build video player widget
  Widget buildVideoPlayer() {
    if (isLoading) {
      return _buildLoadingWidget();
    }

    if (currentVideoType == 'youtube' && youtubePlayerController != null) {
      return _buildYoutubeWidget();
    } else if (currentVideoType == 'video' && videoPlayerController != null && isInitialized) {
      return _buildVideoWidget();
    } else {
      return _buildErrorWidget();
    }
  }

  // Build loading widget
  Widget _buildLoadingWidget() {
    return Container(
      height: 200,
      color: Colors.black,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Loading video...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Build YouTube widget
  Widget _buildYoutubeWidget() {
    return YoutubePlayer(
      controller: youtubePlayerController!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blue,
      progressColors: const ProgressBarColors(
        playedColor: Colors.blue,
        handleColor: Colors.blueAccent,
      ),
      onReady: () {
        if (!isInitialized) {
          _setInitializedState(true);
        }
      },
      onEnded: (metaData) {
        if (hasNextVideo) {
          playNext();
        }
      },
    );
  }

  // Build regular video widget
  Widget _buildVideoWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: videoPlayerController!.value.aspectRatio,
          child: VideoPlayer(videoPlayerController!),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: IconButton(
              onPressed: togglePlayPause,
              icon: Icon(
                videoPlayerController!.value.isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                color: Colors.white,
                size: 64,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Build error widget
  Widget _buildErrorWidget() {
    return Container(
      height: 200,
      color: Colors.black,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              'Unable to load video',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Dispose controllers
  void _disposeCurrentControllers() {
    youtubePlayerController?.removeListener(_onYoutubePlayerStateChanged);
    youtubePlayerController?.dispose();
    videoPlayerController?.dispose();
    youtubePlayerController = null;
    videoPlayerController = null;
    isInitialized = false;
    currentVideoType = '';
  }

  // Utility methods
  bool _isValidIndex(int index) {
    return playlist.isNotEmpty && index >= 0 && index < playlist.length;
  }

  // Getters
  dynamic get currentVideo {
    if (_isValidIndex(currentVideoIndex)) {
      return playlist[currentVideoIndex];
    }
    return null;
  }

  bool get isPlaying {
    if (currentVideoType == 'youtube' && youtubePlayerController != null) {
      return youtubePlayerController!.value.isPlaying;
    } else if (currentVideoType == 'video' && videoPlayerController != null) {
      return videoPlayerController!.value.isPlaying;
    }
    return false;
  }

  bool get hasNextVideo => currentVideoIndex < playlist.length - 1;
  bool get hasPreviousVideo => currentVideoIndex > 0;

  String get playlistPosition => "${currentVideoIndex + 1} / ${playlist.length}";

  String get videoTitle => currentVideoTitle ?? '';
  String get videoDescription => currentVideoDescription ?? '';

  Duration get videoDuration {
    if (currentVideoType == 'video' && videoPlayerController != null) {
      return videoPlayerController!.value.duration;
    }
    return Duration.zero;
  }

  Duration get videoPosition {
    if (currentVideoType == 'video' && videoPlayerController != null) {
      return videoPlayerController!.value.position;
    }
    return Duration.zero;
  }

  @override
  void onClose() {
    _disposeCurrentControllers();
    super.onClose();
  }
}