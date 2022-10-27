// import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';
import 'package:youtuder/outermost/outermost.dart';
import 'package:youtuder/video/video.dart';
import 'package:youtuder/widgets/widgets.dart';

class VideoPlayingScreen extends StatefulWidget {
  final YouTubeVideo video;
  final List<YouTubeVideo> videoList;
  const VideoPlayingScreen(
      {Key? key, required this.video, required this.videoList})
      : super(key: key);
  @override
  State<VideoPlayingScreen> createState() => _VideoPlayingScreenState();
}

class _VideoPlayingScreenState extends State<VideoPlayingScreen> {
  YoutubePlayerController? _playerController;
  bool isReady = false;
  List<YouTubeVideo>? videos;
  @override
  void initState() {
    super.initState();
    _initializeVideoController();
    _refresh();
  }

  Future<void> _refresh() async {
    videos = List.from(widget.videoList);
    videos!.remove(widget.video);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: YoutubePlayerIFrame(
                controller: _playerController!,
                aspectRatio: 16 / 9,
              ),
            ),
            VideoMetaDataTile(
              widget.video,
              color: kGreyColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: _buildDownloadRow(context),
            ),
            Flexible(
              flex: 2,
              child: HomePageContent(
                videosList: videos!,
                onRefresh: _refresh,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _playerController!.close();
  }

  void _initializeVideoController() {
    _playerController = YoutubePlayerController(
      initialVideoId: widget.video.id!,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    _playerController!.listen((event) {
      if (event.isReady) {
        setState(() {
          isReady = true;
        });
      }
    });
  }

  Widget _buildDownloadRow(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LimitedBox(
            child: Text(
              'Download this video---->',
              style: TextStyle(
                fontSize: 28,
                color: kGreyColor,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              tooltip: 'Download this Video',
              onPressed: () async {
                await downloadVid(context, widget.video.url);
              },
              icon: const Icon(
                Icons.download,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );

  Future<void> downloadVid(context, youtubeLink) async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        youtubeLink, widget.video.title, 18);
    // Show that the file was downloaded.
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content:
              Text('Download completed and saved to: ${result.toString()}'),
        );
      },
    );
    // final res = await OpenFile.open(filePath);
    // print('open Result: $res');
  }
}
