import 'outermost/outermost.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(YoutuderApp());
}

class YoutuderApp extends StatelessWidget {
  static YoutubeAPI ytApi = YoutubeAPI(ytApiKey, type: 'video', maxResults: 50);

  final SpeechToText _sttp = SpeechToText();

  YoutuderApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _initSpeech();
    return MaterialApp(
      title: 'Youtuder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(_sttp),
    );
  }

  void _initSpeech() async {
    await _sttp.initialize();
  }
}
