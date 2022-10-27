import 'package:youtuder/outermost/outermost.dart';

class VideoMetaDataTile extends StatelessWidget {
  final YouTubeVideo video;
  const VideoMetaDataTile(this.video, {Key? key, this.color}) : super(key: key);
  final Color? color;
  static final yt = YoutubeExplode();

  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder<Video>(
          future: _getVideoWithViews(),
          builder: (context, snapshot) {
            return _buildMetaDataTile(v: snapshot.data);
          });
    } catch (e) {
      return Text('$e');
    }
  }

  _buildMetaDataTile({Video? v}) {
    return ListTile(
      tileColor: color,
      title: Text(video.title),
      subtitle: Text(
          '${video.channelTitle}${v != null ? ' . ${_getFormattedViews(v.engagement.viewCount)} ' : ''}. ${_getFormattedUploadTime(video.publishedAt)} ago'),
      trailing: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.more_vert),
      ),
    );
  }

  Future<Video> _getVideoWithViews() async {
    return await yt.videos.get(video.id!);
  }

  dynamic _getFormattedUploadTime(String? time) {
    if (time == null) {
      return '0 hours';
    }
    final uploadTime = DateTime.now().difference(DateTime.parse(time));
    int durationInHours = uploadTime.inHours;
    if (durationInHours < 24) {
      return '$durationInHours ${durationInHours > 1 ? 'hours' : 'hour'}';
    }
    int days = durationInHours ~/ 24;
    durationInHours % 24;
    if (days < 7) {
      return '$days ${days > 1 ? 'days' : 'day'}';
    }
    int weeks = days ~/ 7;
    if (weeks < 4) {
      return '$weeks ${weeks > 1 ? 'weeks' : 'week'}';
    }
    int months = weeks ~/ 4;
    if (months < 12) {
      return '$months ${months > 1 ? 'months' : 'month'}';
    }
    int years = months ~/ 12;
    return '$years ${months > 1 ? 'years' : 'year'}';
  }

  dynamic _getFormattedViews(int vm) {
    int views = vm;
    if (views == 0) {
      return '...';
    }
    if (views < 1000) {
      return '$views';
    }
    //if 1300 then 1.3k
    //101,110=100K
    views = views - (views % 100);
    if (views < 1000000) {
      double kViews = views / 1000;
      if (kViews.toString().indexOf('.0') > 0) {
        return '${kViews.toInt()}K';
      }
      return '${kViews.toStringAsFixed(1)}K';
    }
    views = views - (views % 1000);
    //1M=1,000,000 so divide views by it
    double mViews = views / 1000000;
    if (views < 1000000000) {
      if (mViews.toString().indexOf('.0') > 0) {
        return '${mViews.toInt()}M';
      } else {
        return '${mViews.toStringAsFixed(1)}M';
      }
    }
    views = views - (views % 1000000);
    //1B=1,000,000,000 so divide views by it
    double bViews = views / 1000000000;
    if (bViews.toString().indexOf('.0') > 0) {
      return '${bViews.toInt()}B';
    }
    return '${bViews.toStringAsFixed(1)}B';
  }
}
