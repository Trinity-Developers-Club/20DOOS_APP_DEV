import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtuder/outermost/outermost.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({Key? key, required this.sttp}) : super(key: key);
  final SpeechToText sttp;
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen>
    with SingleTickerProviderStateMixin {
  SpeechToText? _sttp;
  String recognizedWords = 'Listening...';
  AnimationController? _controller;
  Animation? _animation;
  @override
  void initState() {
    super.initState();
    _sttp = widget.sttp;
    _startAnimation();
    _startListening();
    _controller!.forward();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_sttp!.isNotListening) {
        _stopListening();
        _controller!.dispose();
        Navigator.pop(
          context,
          recognizedWords == 'Listening...' ? '' : recognizedWords,
        );
        timer.cancel();
      }
    });
  }

  _startAnimation() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.bounceOut);
    _animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
      _controller!.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.clear,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recognizedWords,
                  style: _buildTextStyle(30, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Try saying', style: _buildTextStyle(25)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('"Play Google Song"', style: _buildTextStyle(18)),
                    Expanded(
                      child: CircleAvatar(
                        radius: _animation!.value * 20 + 60,
                        backgroundColor: kGreyColor,
                        child: CircleAvatar(
                          backgroundColor: Colors.red[500],
                          radius: 50,
                          child: const Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(double fontSize, {Color color = Colors.grey}) {
    return TextStyle(color: color, fontSize: fontSize);
  }

  void _startListening() async {
    await _sttp!.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _sttp!.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      recognizedWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    // if (_controller!.status == AnimationStatus.forward ||
    //     _controller!.status == AnimationStatus.reverse) {
    //   _controller!.notifyStatusListeners(AnimationStatus.dismissed);
    //
    // }
    if (_controller!.isAnimating) {
      _controller!.dispose();
    }
    super.dispose();
  }
}
