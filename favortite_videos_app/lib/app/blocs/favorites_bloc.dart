import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc implements BlocBase {
  Map<String, VideoModel> _favorites = {};

  final StreamController<Map<String, VideoModel>> _favController =
      StreamController.broadcast();
  Stream<Map<String, VideoModel>> get outFav => _favController.stream;

  FavoriteBloc() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains('favorites')) {
        _favorites = json
            .decode(prefs.getString('favorites')!)
            .map(
              (k, v) => MapEntry(k, VideoModel.fromJson(v)),
            )
            .cast<String, VideoModel>();
        _favController.add(_favorites); // mandando para o sink.
      }
    });
  }

  void toggleFavorite(VideoModel video) {
    if (_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      _favorites[video.id] = video;
    }

    _favController.sink.add(_favorites);
    _saveFav();
  }

  void _saveFav() {
    SharedPreferences.getInstance().then(
      (prefs) => prefs.setString("favorites", json.encode(_favorites)),
    );
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _favController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}
