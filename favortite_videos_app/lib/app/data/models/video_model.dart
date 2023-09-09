class VideoModel {
  final String id;
  final String title;
  final String thumb;
  final String channel;

  VideoModel({
    required this.id,
    required this.title,
    required this.thumb,
    required this.channel,
  });

  Map<String, dynamic> toJson() {
    return {
      'videoId': id,
      'title': title,
      'thumb': thumb,
      'channel': channel,
    };
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return json.containsKey('id')
        ? VideoModel(
            id: json["id"]["videoId"],
            title: json["snippet"]["title"],
            thumb: json["snippet"]["thumbnails"]["high"]["url"],
            channel: json["snippet"]["channelTitle"],
          )
        : VideoModel(
            id: json['videoId'],
            title: json['title'],
            thumb: json['thumb'],
            channel: json['channel'],
          );
  }
}
