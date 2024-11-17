// import 'package:get/get.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:video_player/video_player.dart';
//
//
// class VideoController extends GetxController {
//   int currentPlayingIndex = -1; // No video playing initially
//   VideoPlayerController? videoPlayerController;
//   YoutubePlayerController? youtubePlayerController;
//
//   void playVideo(int index) {
//     // Dispose controllers if a new video is selected
//     if (currentPlayingIndex != index) {
//       _disposeControllers();
//       currentPlayingIndex = index;
//       var video = hundredDaysBasicEnglishCourseData[index];
//
//       // Check if the video is a YouTube video
//       if (video.youtubeLink != null &&
//           (video.youtubeLink.contains('youtube.com') || video.youtubeLink.contains('youtu.be'))) {
//         String? videoId = YoutubePlayer.convertUrlToId(video.youtubeLink);
//         if (videoId != null) {
//           youtubePlayerController = YoutubePlayerController(
//             initialVideoId: videoId,
//             flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
//           );
//         }
//       } else if (video.youtubeLink != null) {
//         videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(video.youtubeLink));
//         videoPlayerController!.initialize().then((_) {
//           videoPlayerController!.play();
//           update(); // UI update after video starts
//         });
//       }
//
//       update(); // UI update after selecting video
//     }
//   }
//
//   void _disposeControllers() {
//     youtubePlayerController?.pause();
//     youtubePlayerController?.dispose();
//     youtubePlayerController = null;
//
//     videoPlayerController?.pause();
//     videoPlayerController?.dispose();
//     videoPlayerController = null;
//   }
//
//   @override
//   void onClose() {
//     _disposeControllers();
//     super.onClose();
//   }
// }
