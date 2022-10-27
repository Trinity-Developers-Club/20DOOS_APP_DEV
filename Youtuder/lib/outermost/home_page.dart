import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtuder/outermost/outermost.dart';
import 'package:youtuder/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.sttp, {Key? key}) : super(key: key);
  final SpeechToText sttp;
  static const ConnectivityResult notConnected = ConnectivityResult.none;
  static ConnectivityResult? netStatus;
  static RoundedDialogContainer buildNoNetDialog(context,
      {double? verticalPadding}) {
    return RoundedDialogContainer(
      verticalPadding: verticalPadding,
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: const [
              Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
              Expanded(
                child: Text(
                  'Connection error!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Please connect to the internet!',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (context != _HomePageState.mainContext) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Ok'))
        ],
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentScreenIndex = 0;
  List<YouTubeVideo> videosList = [];
  SpeechToText? _sttp;
  StreamSubscription<ConnectivityResult>? connectivity;
  static BuildContext? mainContext;
  @override
  void initState() {
    super.initState();
    _sttp = widget.sttp;
    _checkConnection();
    setState(() {
      mainContext = context;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MySearchAppBar(
        onSearched: () {
          showSearch(
              context: context, delegate: MySearchDiligate(context, _sttp!));
        },
      ),
      body: Scrollbar(
        child: HomePage.netStatus == HomePage.notConnected
            ? Center(
                child: HomePage.buildNoNetDialog(context, verticalPadding: 150))
            : videosList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : HomePageContent(
                    videosList: videosList,
                    onRefresh: _getPopularVideos,
                    isFirstScreen: true,
                  ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentScreenIndex: currentScreenIndex,
        onPressed: (value) => () {
          setState(() {
            currentScreenIndex = value;
          });
        },
      ),
    );
  }

  _checkConnection() async {
    connectivity = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        HomePage.netStatus = result;
      });
      if (HomePage.netStatus == HomePage.notConnected) {
        showDialog(
            context: context,
            builder: (context) => HomePage.buildNoNetDialog(context));
      } else {
        _getPopularVideos();
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    connectivity!.cancel();
    _sttp!.cancel();
  }

  ///gets popular videos which are shown on first page
  Future<void> _getPopularVideos() async {
    videosList = await YoutuderApp.ytApi.getTrends(regionCode: 'PK');
    setState(() {});
  }
}
