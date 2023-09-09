import 'dart:async';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:flutter/material.dart';

import '../api.dart';

class VideosBloc implements BlocBase {
  late Api api;

  List<VideoModel>? videos;

  final StreamController _videosStreamController =
      StreamController<List<VideoModel>>();
  Stream get outVideos => _videosStreamController.stream;

  final _searchController = StreamController<String?>();
  Sink get inSearch => _searchController.sink;

  VideosBloc() {
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String? search) async {
    if (search != null) {
      videos = await api.search(search);
    } else {
      videos = videos! + await api.nextPage();
    }
    _videosStreamController.sink.add(videos);
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void dispose() {
    _videosStreamController.close();
    _searchController.close();
  }

  @override
  bool get hasListeners => true;

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}
}
