import 'package:youtuder/outermost/outermost.dart';
import 'package:youtuder/video/video.dart';

class VideoTile extends StatelessWidget {
  const VideoTile(
      {Key? key,
      required this.video,
      required this.videos,
      this.isFirstScreen = false,
      this.isClickable = true})
      : super(key: key);

  final YouTubeVideo video;
  final List<YouTubeVideo> videos;

  final bool isClickable;
  final bool isFirstScreen;
  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (isClickable) {
                  _navigateToVideoPayerScreen(context,
                      isFirstScreen: isFirstScreen);
                }
              },
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  video.thumbnail.high.url ??
                      video.thumbnail.medium.url ??
                      video.thumbnail.small.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: VideoMetaDataTile(video),
            ),
          ],
        ),
      );
    } catch (e) {
      return Text('$e');
    }
  }

  void _navigateToVideoPayerScreen(BuildContext context,
      {bool isFirstScreen = false}) {
    if (isFirstScreen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VideoPlayingScreen(video: video, videoList: videos),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              VideoPlayingScreen(video: video, videoList: videos),
        ),
      );
    }
  }
}
