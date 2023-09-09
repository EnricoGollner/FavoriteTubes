import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController {
  YoutubePlayerController controller(String videoId) {
    return YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }
}
