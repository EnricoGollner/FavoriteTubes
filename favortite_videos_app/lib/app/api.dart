import 'dart:convert';

import 'package:favortite_videos_app/app/data/http/http_client.dart';
import 'package:favortite_videos_app/app/data/models/video_model.dart';
import 'package:http/http.dart' as http;

const apiKey = "AIzaSyBgFMU6atNgavrkSClXjVtpBIT0FwfzcsA";

class Api {
  final httpClient = HttpClient();

  String? _search;
  String? _nextToken;

  Future<List<VideoModel>> search(String search) async {
    _search = search;

    http.Response response = await httpClient.get(
        url:
            "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$apiKey&maxResults=10");

    return decode(response);
  }

  Future<List<VideoModel>> nextPage() async {
    http.Response response = await httpClient.get(
        url:
            "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$apiKey&maxResults=10&pageToken=$_nextToken");

    return decode(response);
  }

  List<VideoModel> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      _nextToken = decoded["nextPageToken"];

      List<VideoModel> videos = decoded["items"]
          .map<VideoModel>(
            (item) => VideoModel.fromJson(item),
          )
          .toList();

      return videos;
    } else {
      throw Exception("Failed to load videos ${response.statusCode}");
    }
  }
}
