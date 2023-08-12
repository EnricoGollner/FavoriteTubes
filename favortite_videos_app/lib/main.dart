import 'package:favortite_videos_app/app/api.dart';
import 'package:flutter/material.dart';

import 'app/main_app.dart';

void main() {
  Api api = Api();

  api.search("gt");

  runApp(const MainApp());
}
