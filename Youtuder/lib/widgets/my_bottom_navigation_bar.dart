import 'package:flutter/material.dart';
import 'package:youtuder/outermost/outermost.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar(
      {Key? key, required this.currentScreenIndex, required this.onPressed})
      : super(key: key);
  final int currentScreenIndex;
  final Function(int index) onPressed;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentScreenIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 1
                  ? Icons.video_label
                  : Icons.video_label_outlined,
            ),
            label: 'Shorts'),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor:
                    currentScreenIndex == 2 ? Colors.red : Colors.white70,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color:
                          currentScreenIndex == 2 ? Colors.red : Colors.white70,
                    ),
                  ),
                  radius: 19,
                ),
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              currentScreenIndex == 3
                  ? Icons.subscriptions
                  : Icons.subscriptions_outlined,
            ),
            label: 'Subscriptions'),
        BottomNavigationBarItem(
            icon: Icon(currentScreenIndex == 4
                ? Icons.video_library
                : Icons.video_library_outlined),
            label: 'Library'),
      ],
      unselectedItemColor: Colors.white70,
      selectedItemColor: Colors.red,
      unselectedLabelStyle: kWhiteTextStyle,
      showUnselectedLabels: true,
      onTap: onPressed,
    );
  }
}
