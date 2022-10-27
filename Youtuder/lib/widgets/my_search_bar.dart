import 'package:flutter/material.dart';
import 'package:youtuder/outermost/outermost.dart';

class MySearchAppBar extends StatelessWidget with PreferredSizeWidget {
  final Function() onSearched;
  final String title;
  MySearchAppBar({Key? key, required this.onSearched, this.title = 'Youtube'})
      : super(key: key);
  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(kYoutubeLogo),
            ),
            Text(title),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.connected_tv_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notification_add_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearched,
          ),
          TextButton(
            onPressed: () {},
            child: const CircleAvatar(
              radius: 11,
              foregroundImage: AssetImage(kYoutubeLogo),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return _appBar();
  }

  @override
  Size get preferredSize => _appBar().preferredSize;
}
