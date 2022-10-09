import 'package:flutter/material.dart';

showDialogBox({
  BuildContext? context,
  String? winOrTie,
  String? playerName,
  Function? onTap,
  Color? bgClr,
  Color? iconBg,
}) {
  return showDialog(
      context: context!,
      builder: (context) {
        return Dialog(
          backgroundColor: winOrTie == 'tie' ? Colors.grey.shade200 : bgClr,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 210,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    children: [
                      Text(
                        winOrTie == 'tie' ? 'T I E' : 'W I N  W I N',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        playerName! == ''
                            ? "It's a Tie"
                            : ('Player $playerName won!'),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () {
                          onTap;
                          Navigator.of(context).pop();
                        },
                        color: winOrTie == 'tie' ? Colors.black : iconBg,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: winOrTie == 'tie' ? Colors.white : iconBg,
                  radius: 60,
                  child: Icon(
                    winOrTie == 'tie' ? Icons.flag : Icons.wine_bar,
                    color: winOrTie == 'tie' ? Colors.black : Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
