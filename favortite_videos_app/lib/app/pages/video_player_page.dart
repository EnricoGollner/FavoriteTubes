import 'package:favortite_videos_app/app/controllers/youtube_controller.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  final String videoId;
  const VideoPlayerPage({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final ytController = YoutubeController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: Column(children: [
        YoutubePlayer(
          controller: ytController.controller(videoId),
          showVideoProgressIndicator: true,
        ),
        const SizedBox(height: 10),
        // const Text(
        //   "Sugestões",
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        // Expanded(child: Container())
      ]),
    );
  }
}
