import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:youtuder/outermost/outermost.dart';
import 'package:youtuder/video/video.dart';

class HomePageContent extends StatelessWidget {
  final List<YouTubeVideo> videosList;
  final Future<void> Function()? onRefresh;
  final bool isFirstScreen;
  const HomePageContent(
      {Key? key,
      required this.videosList,
      this.onRefresh,
      this.isFirstScreen = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Colors.transparent,
      animSpeedFactor: 1.5,
      backgroundColor: Colors.white,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: onRefresh ?? () async {},
      child: HomePage.netStatus == HomePage.notConnected
          ? HomePage.buildNoNetDialog(context)
          : ListView.builder(
              itemCount: videosList.length,
              itemBuilder: (context, index) => VideoTile(
                video: videosList[index],
                videos: videosList,
                isFirstScreen: isFirstScreen,
              ),
            ),
    );
  }
}
