import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favortite_videos_app/app/blocs/videos_bloc.dart';
import 'package:flutter/material.dart';

import 'app/main_app.dart';

void main() {
  runApp(BlocProvider(
    blocs: [Bloc((i) => VideosBloc())],
    dependencies: const [],
    child: const MainApp(),
  ));
}
