import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favortite_videos_app/app/blocs/favorites_bloc.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:favortite_videos_app/app/pages/video_player_page.dart';
import 'package:favortite_videos_app/app/widgets/video_tile_fav_recomended.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder<Map<String, VideoModel>>(
          stream: favoritesBloc.outFav,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.values.length,
                    itemBuilder: (context, index) {
                      final video = snapshot.data!.values.toList()[index];

                      return VideoTileFavRecomended(
                          video: video, favoritesBloc: favoritesBloc);
                    },
                  )
                : Container();
          }),
    );
  }
}
