import 'package:flutter/material.dart';

import '../data/models/video_model.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.video});

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(video.thumb),
    );
  }
}
