import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favortite_videos_app/app/blocs/favorites_bloc.dart';
import 'package:favortite_videos_app/app/blocs/videos_bloc.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:favortite_videos_app/app/pages/favorites_page.dart';
import 'package:favortite_videos_app/delegates/data_search.dart';
import 'package:flutter/material.dart';

import '../widgets/video_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final VideosBloc videosBloc = BlocProvider.getBloc<VideosBloc>();
    final FavoriteBloc favoritesBloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          child: Image.asset("assets/youtube_logo.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, VideoModel>>(
                stream: favoritesBloc.outFav,
                initialData: const {},
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Text('${snapshot.data!.length}')
                      : Container();
                }),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ));
            },
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () async {
              String? result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null) videosBloc.inSearch.add(result);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: StreamBuilder(
        stream: videosBloc.outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(video: snapshot.data[index]);
                } else if (index > 1) {
                  videosBloc.inSearch.add(null);
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return const Center(child: Icon(Icons.search));
          }
        },
      ),
    );
  }
}
