import 'dart:convert';

import 'package:favortite_videos_app/app/data/http/http_client.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyAiutmczPzLoTPor6YZ5tVaMcua8gP5q5s";
/*
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"

*/

class Api {
  search(String search) async {
    final httpClient = HttpClient();

    http.Response response = await httpClient.get(
        url:
            "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10");

    decode(response);
  }

  List<VideoModel>? decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<VideoModel> videos = decoded["items"]
          .map<VideoModel>(
            (item) => VideoModel.fromJson(item),
          )
          .toList();

      return videos;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
