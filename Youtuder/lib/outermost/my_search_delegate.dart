import 'dart:async';

import 'package:datamuse/datamuse.dart';
import 'package:http/http.dart';
import 'package:youtuder/widgets/widgets.dart';

import '../helper/voice_record_screen.dart';
import 'outermost.dart';

class MySearchDiligate extends SearchDelegate<dynamic> {
  final SpeechToText speechToText;
  final BuildContext context;
  MySearchDiligate(this.context, this.speechToText);
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: AnimatedIcon(
        progress: transitionAnimation,
        icon: AnimatedIcons.menu_arrow,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    try {
      return FutureBuilder<List<YouTubeVideo>>(
          future: YoutuderApp.ytApi.search(query),
          builder: (context, data) {
            if (data.hasData) {
              return HomePageContent(
                videosList: data.data!,
                onRefresh: () async => showResults(context),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
    } catch (e) {
      // print(e);
      return Center(child: Text('$e', style: kWhiteTextStyle));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    try {
      return FutureBuilder<List<String>>(
        future: _getSuggestionList(query),
        builder: (context, object) {
          if (object.hasData) {
            List<String> data = object.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  try {
                    return ListTile(
                      onTap: () {
                        query = data[index];
                        showResults(context);
                      },
                      title: RichText(
                        text: TextSpan(
                          text: data[index < data.length ? index : 2]
                              .substring(0, query.length),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          children: [
                            TextSpan(
                              text: data[index < data.length ? index : 0]
                                  .substring(query.length),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    );
                  } catch (e) {
                    return ListTile(title: Text(query));
                  }
                });
          } else {
            return const Text('');
          }
        },
      );
    } catch (e) {
      // print(e);
      return const Text('');
    }
  }

  Future<List<String>> _getSuggestionList(String query) async {
    try {
      var data = await get(Uri.parse(
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
      }
      if (list.isEmpty) {
        var muse = Datamuse();
        final list = await muse.suggest(query);
        final List<String> suggestions = [];
        for (int i = 0; i < list.length; i++) {
          final word = list[i].word;
          suggestions.add(word);
        }
        return suggestions;
      }
      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      IconButton(
        icon: CircleAvatar(
          backgroundColor: kGreyColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.mic),
        ),
        onPressed: () async {
          query = '';
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordingScreen(sttp: speechToText),
            ),
          );
          if (result != null && result != '') {
            query = result;
            showResults(context);
          }
        },
      ),
    ];
  }
}
