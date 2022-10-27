/**
 * ListView.separated(
              padding: const EdgeInsets.all(10.0),
              itemCount: list.length,
              itemBuilder: (context, index) {
                try {
                  // return VideoTile(
                  //   video: videos[index],
                  //   videoMetaData: videosMetaData.length > index
                  //       ? videosMetaData[index]
                  //       : VideoMetaData.getNullableVideoMetaData(),
                  //
                  return Text('${list[index]}');
                } catch (e) {
                  return Text('$e');
                }
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
 */

// _getPopularVideos() async {
//   setState(() {
//     loading = true;
//   });
//   final popularVideos = await NetworkHelper.getMostPopularVideos();
//   if (popularVideos.isNotEmpty) {
//     setState(() {
//       loading = false;
//       videos = popularVideos;
//       _setVideosMetaData();
//     });
//   }
// }

// _setVideosMetaData() async {
//   for (var i = 0; i < videos.length; i++) {
//     final videoMetaData = await NetworkHelper.getVideoMetaData(videos[i].id);
//     videosMetaData.add(videoMetaData);
//     setState(() {});
//   }
// }

/**
   * searchBtnPressed
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  setState(() {
                    searchBtnPressed = false;
                  });
                },
              ),
              title: TextField(
                onChanged: (value) => setState(() {
                  searchTitle = value;
                  _querySuggestions(searchTitle);
                }),
                cursorColor: Colors.red,
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: kGreyColor,
                  filled: true,
                  hintText: 'Search Youtube',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      // if (searchTitle != null && searchTitle != '') {
                      //   setState(() {
                      //     loading = true;
                      //   });
                      //   final response =
                      //       await NetworkHelper.getVideosList(searchTitle!);
                      //   setState(() {
                      //     videos = response;
                      //     loading = false;
                      //   });
                      // }
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: CircleAvatar(
                    backgroundColor: kGreyColor,
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.keyboard_voice),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          : 
   */

//query suggestions from youtube in .txt file
//https://suggestqueries.google.com/complete/search?client=youtube&ds=yt&q=google

//request to google api for getting suggestions

/**
    try{
    var data = await http.get(Uri.parse(
    'https://suggestqueries.google.com/complete/search?client=youtube&ds=yt&q=$query'));
    String str = data.body;
    str = str.substring(str.indexOf('h(') + 3, str.indexOf('{'));
    str = str.replaceAll('[', '');
    str = str.replaceAll(']', '');
    str = str.replaceAll('"', '');
    final suggestions = str.split(',');
    final List<String> list = [];
    for (int i = 0; i < suggestions.length; i++) {
    final element = suggestions[i];

    if (element.startsWith(query.characters.first)) {
    list.add(element);
    }
    return list;
    }catch(e){print(e);}
 */

/**
 * import 'package:connectivity_plus/connectivity_plus.dart';

    @override
    initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
    })
    }

    // Be sure to cancel subscription after you are done
    @override
    dispose() {
    super.dispose();

    subscription.cancel();
    }
 */

/**
 *
 *
     // if (query == '') {
    //   return [];
    // }
    // var muse = Datamuse();
    // final list = await muse.suggest(query);
    // final List<String> suggestions = [];
    // for (int i = 0; i < list.length; i++) {
    //   final word = list[i].word;
    //   suggestions.add(word);
    // }
    // return suggestions;
 */

/**
 * // dynamic _getFirstNwordsOfText(String text, {int length = 7}) {
    //   final words = text.split(' ');
    //   String newTitle = '';
    //   for (var i = 0; i < words.length; i++) {
    //     if (i > length + 1 && newTitle.length >= 40) {
    //       break;
    //     }
    //     newTitle += words[i] + " ";
    //   }
    //   return newTitle;
    // }

    // void _navigateToVideoPayerScreen(context) async {
    //   final player = YoutubePlayerController(
    //     initialVideoId: video.id,
    //     params: const YoutubePlayerParams(showFullscreenButton: true),
    //   );
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => VideoPlayingScreen(
    //         videoController: player,
    //         video: video,
    //         videoMetaData: videoMetaData,
    //       ),
    //     ),
    //   );
    // }
    }
 */

//   final apiUrl = Uri.parse(
//       '''https://www.googleapis.com/youtube/v3/videos?part=snippet&part=contentDetails&part=statistics&chart=mostPopular&regionCode=PK&maxResults=50&key=AIzaSyD1XiHAdI_r33hpMsxmdCRwATYtonmU2Zo
//     ''');
//   final response = await http.get(apiUrl);
//   final body = json.decode(response.body);
//   List<PopularVideo> popularVideos = [];
//   for (var i = 0; i < body['items'].length; i++) {
//     popularVideos.add(PopularVideo.fromJson(body, index: i));
//   }
//   List<Video> videos = [];
//   setState(() {
//     if (popularVideos.isNotEmpty) {
//       for (int i = 0; i < popularVideos.length; i++) {
//         Video video = popularVideos[i].toVideo();
//         videos.add(video);
//       }
//     }
//   });
//   if (videos.isNotEmpty) {
//     videosList = videos;
//   }
// }

/**
    //
    // import 'package:youtuder/outermost/outermost.dart';
    //
    // class PopularVideo {
    //   String id;
    //   String title;
    //   String? thumbnailUrl;
    //   String? channelId;
    //   String? channelTitle;
    //   String? description;
    //   String? publishTime;
    //   VideoMetaData metaData;
    //   bool? isLive;
    //   PopularVideo({
    //     this.isLive,
    //     required this.id,
    //     required this.title,
    //     required this.metaData,
    //     this.thumbnailUrl,
    //     this.channelId,
    //     this.channelTitle,
    //     this.description,
    //     this.publishTime,
    //   });
    //
    //   Map<String, dynamic> toJson() => {
    //         'videoId': id,
    //         'title': title,
    //         'thumbnailUrl': thumbnailUrl,
    //         'channelId': channelId,
    //         'channelTitle': channelTitle,
    //         'description': description,
    //         'publishTime': publishTime,
    //       };
    //
    //   ///converts a my video object into its equivalent video object
    //   YouTubeVideo toYoutubeVideo() {
    //     YouTubeVideo(data);
    //     Thumbnails thumbnails = ThumbnailSet(id);
    //     Engagement engagement = Engagement(metaData.views, metaData.likes, 0);
    //     Video video = Video(
    //       VideoId(id),
    //       title,
    //       channelTitle!,
    //       ChannelId(channelId!),
    //       DateTime.parse(publishTime!),
    //       DateTime.parse(publishTime!),
    //       description!,
    //       metaData.duration,
    //       thumbnails,
    //       [title.split('').first],
    //       engagement,
    //       isLive!,
    //     );
    //     return video;
    //   }
    //
    //   static PopularVideo fromJson(json, {int index = 0}) {
    //     final urlData = json['items'][index]['snippet']['thumbnails'];
    //     return PopularVideo(
    //       id: json['items'][index]['id'],
    //       title: json['items'][index]['snippet']['title'],
    //       thumbnailUrl: urlData['maxres']?['url'] ??
    //           urlData['standard']?['url'] ??
    //           urlData['high']?['url'] ??
    //           urlData['medium']?['url'] ??
    //           urlData['default']['url'],
    //       channelId: json['items'][index]['snippet']['channelId'],
    //       channelTitle: json['items'][index]['snippet']['channelTitle'],
    //       isLive: json['items'][index]['snippet']['liveBroadcastContent'] == 'none',
    //       description: json['items'][index]['snippet']['description'],
    //       publishTime: json['items'][index]['snippet']['publishedAt'],
    //       metaData: VideoMetaData.parse(json['items'][index]),
    //     );
    //   }
    //
    //   @override
    //   String toString() {
    //     return 'Video id: $id\ntitle: $title\nurl:$thumbnailUrl\nchannel name: $channelTitle';
    //   }
    // }
    //
    // class VideoMetaData {
    //   static VideoMetaData parse(json) {
    //     return VideoMetaData(
    //       likes: _parseStr(json['statistics']['likeCount']),
    //       views: _parseStr(json['statistics']['viewCount']),
    //       comments: _parseStr(json['statistics']['commentCount'] ?? '0'),
    //       duration: _getFormattedDuration(json),
    //     );
    //   }
    //
    //   static _parseStr(String integer) {
    //     return int.parse(integer);
    //   }
    //
    //   int likes, views, comments;
    //   Duration duration;
    //   VideoMetaData(
    //       {required this.likes,
    //       required this.views,
    //       required this.comments,
    //       required this.duration});
    //
    //   @override
    //   String toString() {
    //     return 'Likes: $likes,Views: $views,Comments: $comments,Duration : $duration';
    //   }
    //
    //   static _getFormattedDuration(jsonObject) {
    //     Duration duration;
    //     String durationString = jsonObject['contentDetails']['duration'];
    //     // ignore: unnecessary_null_comparison
    //     if (durationString != null && durationString == '') {
    //       durationString = durationString.substring(durationString.indexOf('PT'));
    //       int mins = 0;
    //       int hours = 0;
    //       int seconds = 0;
    //       if (durationString.indexOf('H') > 0) {
    //         final hourStr =
    //             durationString.substring(0, durationString.indexOf('H'));
    //         hours = int.parse(hourStr);
    //       }
    //       if (durationString.indexOf('M') > 0) {
    //         final minsStr =
    //             durationString.substring(0, durationString.indexOf('M'));
    //         mins = int.parse(minsStr);
    //       }
    //       if (durationString.indexOf('S') > 0) {
    //         final secStr = durationString.substring(0, durationString.indexOf('S'));
    //         seconds = int.parse(secStr);
    //       }
    //       duration = Duration(hours: hours, minutes: mins, seconds: seconds);
    //     } else {
    //       duration = const Duration();
    //     }
    //     return duration;
    //   }
    // }
    //
    // // static fromJson(body) => VideoMetaData(
    // //   likes: _parse(body['items'][0]['statistics']?['likeCount'] ?? '0'),
    // //   views: _parse(body['items'][0]['statistics']?['viewCount'] ?? '0'),
    // //   comments:
    // //   _parse(body['items'][0]['statistics']?['commentCount'] ?? '0'),
    // //   duration: _getFormattedDuration(body['items'][0]),
    // // );
    //
    // //

*/

/*
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
 */

/*
 // Get video metadata.
  var video = await VideoMetaDataTile.yt.videos.get(id);

  // Get the video manifest.
  var manifest =
      await VideoMetaDataTile.yt.videos.streamsClient.getManifest(id);
  var streams = manifest.videoOnly;

  // Get the audio track with the highest bitrate.
  var audio = streams.first;
  var audioStream = VideoMetaDataTile.yt.videos.streamsClient.get(audio);

  // Compose the file name removing the unallowed characters in windows.
  var fileName = '${video.title}.${audio.container.name.toString()}'
      .replaceAll(r'\', '')
      .replaceAll('/', '')
      .replaceAll('*', '')
      .replaceAll('?', '')
      .replaceAll('"', '')
      .replaceAll('<', '')
      .replaceAll('>', '')
      .replaceAll('|', '');
  var dir = await getApplicationDocumentsDirectory();
  dir = await Directory(dir.path + '/' + 'downloads').create(recursive: true);

  var file = File('${dir.path}/$fileName');
  // Delete the file if exists.
  if (file.existsSync()) {
    file.deleteSync();
  }

  // Open the file in writeAppend.
  var output = file.openWrite(mode: FileMode.writeOnlyAppend);

  // Track the file download status.
  var len = audio.size.totalBytes;
  var count = 0;

  // Create the message and set the cursor position.
  var msg = 'Downloading ${video.title}.${audio.container.name}';

  // Listen for data received.
  var progressBar = FAProgressBar();
  await for (final data in audioStream) {
    // Keep track of the current downloaded data.
    count += int.parse(data.length.toString());

    // Calculate the current progress.
    var progress = ((count / len) * 100).ceil();

    // Update the progressbar.
    progressBar = FAProgressBar(
      displayText: '$progress',
    );

    // Write to file.
    print('downloaded  little bit');
  }
 */

/*
var manifest = await yt.videos.streamsClient.getManifest(id);
    var streamInfo = manifest.muxed.sortByVideoQuality().first;
    if (streamInfo != null) {
      var stream = yt.videos.streamsClient.get(streamInfo);
      final dir = await getApplicationDocumentsDirectory();
      var file = File(dir.path + '/${widget.video.title}');
      var fileStream = file.openWrite();
      try {
        await stream.pipe(fileStream).then((value) {
          setState(() {
            text = value.toString();
          });
          return value;
        }).catchError((err) => text = err);
      } catch (err) {
        text = err.toString();
        setState(() {});
      }

      await fileStream.flush();
      await fileStream.close();
      return file.path;
    }
    return '';
 */

/*
Future<void> download(BuildContext context, String id) async {
    var video = widget.video;
    var yt = VideoMetaDataTile.yt;
// Display info about this video.
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              Text('Title: ${video.title}, Duration: ${video.duration}'),
              const SizedBox(height: 10),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.download_outlined))
            ],
          ),
        );
      },
    );

// Get the streams manifest and the audio track.
    var manifest = await yt.videos.streamsClient.getManifest(id);
    var audio = manifest.audioOnly.last;

// Build the directory.
    var dir =
        await getExternalStorageDirectories(type: StorageDirectory.downloads);
    var filePath = join(
        dir!.first.uri.toFilePath(), '${video.id}.${audio.container.name}');

// Open the file to write.
    var file = File(filePath);
    var fileStream = file.openWrite();

// Pipe all the content of the stream into our file.
    await yt.videos.streamsClient.get(audio).pipe(fileStream);
/*
                  If you want to show a % of download, you should listen
                  to the stream instead of using `pipe` and compare
                  the current downloaded streams to the totalBytes,
                  see an example ii example/video_download.dart
                   */

// Close the file.
    await fileStream.flush();
    await fileStream.close();

// Show that the file was downloaded.
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Download completed and saved to: ${filePath}'),
        );
      },
    );
    final res = await OpenFile.open(filePath);
    print('open Result: $res');
  }
 */
