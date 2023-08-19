import 'package:flutter/material.dart';

import '../data/models/video_model.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.video});

  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0, // proporçao 16:9 (youtube videos)
            child: Image.network(
              video.thumb,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Text(
                        video.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        video.channel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star_border),
                color: Colors.blueAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
