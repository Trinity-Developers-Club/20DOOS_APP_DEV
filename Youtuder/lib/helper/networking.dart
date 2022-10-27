// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:youtuder/video/popular_video.dart';

// class NetworkHelper {
//   static const apiKey = 'AIzaSyD1XiHAdI_r33hpMsxmdCRwATYtonmU2Zo';
//   static const apiUrl = 'https://www.googleapis.com/youtube/v3';

//   static Future<List<MyVideo>> getVideosList(String searchTitle) async {
//     Uri uri = Uri.parse(
//         '$apiUrl/search?part=snippet&q=$searchTitle&maxResults=50&key=$apiKey');
//     final response = await http.get(uri);
//     final body = json.decode(response.body);
//     List<MyVideo> videos = [];
//     for (var i = 0; i < body['items'].length; i++) {
//       if (body['items'][i]['id'].containsKey('videoId')) {
//         videos.add(
//           MyVideo.fromJson(body, index: i),
//         );
//       }
//     }
//     // Map map = {'videoId': 'id'};
//     // print('Length: ${videos.length}');
//     return videos;
//   }

//   static Future<VideoMetaData> getVideoMetaData(String id) async {
//     final body = await _getVideoData(id);
//     return VideoMetaData.fromJson(body);
//   }

//   static Future<MyVideo> getVideo(String id) async {
//     final body = await _getVideoData(id);
//     return MyVideo.fromJson(body);
//   }

//   static Future<dynamic> _getVideoData(String id) async {
//     const part = 'part=snippet&part=contentDetails&part=statistics';
//     Uri uri = Uri.parse('$apiUrl/videos?$part&id=$id&key=$apiKey');
//     final response = await http.get(uri);
//     final body = json.decode(response.body);
//     return body;
//   }

//   static Future<List<MyVideo>> getMostPopularVideos() async {
//     const part =
//         'part=snippet&part=contentDetails&part=statistics&chart=mostPopular&regionCode=PK';
//     Uri uri = Uri.parse('$apiUrl/videos?$part&maxResults=50&key=$apiKey');
//     final response = await http.get(uri);
//     final body = json.decode(response.body);
//     List<MyVideo> videos = [];
//     for (var i = 0; i < body['items'].length; i++) {
//       videos.add(MyVideo.fromJson(body, index: i, isPopularVideosSearch: true));
//       // Map map = {'videoId': 'id'};
//       // print('Length: ${videos.length}');
//     }
//     return videos;
//   }
//   static getVideos() async {}
// }

// //single video get request sample
// //https://www.googleapis.com/youtube/v3/videos?part=snippet&part=contentDetails&part=statistics&id=4gQoUj47Am4&key=AIzaSyD1XiHAdI_r33hpMsxmdCRwATYtonmU2Zo
