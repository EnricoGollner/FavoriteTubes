import 'package:favortite_videos_app/app/blocs/favorites_bloc.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:favortite_videos_app/app/pages/video_player_page.dart';
import 'package:flutter/material.dart';

class VideoTileFavRecomended extends StatelessWidget {
  const VideoTileFavRecomended({
    super.key,
    required this.video,
    required this.favoritesBloc,
  });

  final VideoModel video;
  final FavoriteBloc favoritesBloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(videoId: video.id),
          ),
        );
      },
      onLongPress: () {
        favoritesBloc.toggleFavorite(video);
      },
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 70,
            child: Image.network(video.thumb),
          ),
          Expanded(
              child: Text(
            video.title,
            style: const TextStyle(fontSize: 17, color: Colors.white70),
            maxLines: 2,
          ))
        ],
      ),
    );
  }
}
