// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tictactoe/dialog.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTrunOfX = true;
  int scoreOfO = 0;
  int scoreOfX = 0;
  int filledBoxes = 0;
  final List<String> gameSpace = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTrunOfX ? kXbgclr : kObgclr,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: isTrunOfX ? kplayerNameX : kplayerNameO,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              clearBoard();
            },
            icon: Icon(
              Icons.replay_outlined,
              color: isTrunOfX ? kplayerNameX : kplayerNameO,
            ),
          )
        ],
        backgroundColor: isTrunOfX ? kXbgclr : kObgclr,
      ),
      body: Column(
        children: [
          //playerinfo
          playerInfo(),
          SizedBox(height: 10),
          //Grid
          gameSpaceGrid(),
          //turnInfo
          turnInfo(),
        ],
      ),
    );
  }

  Widget playerInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Player O',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.red.shade900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                scoreOfO.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kScoreOclr,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Player X',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.green.shade900,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                scoreOfX.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kScoreXclr,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  gameSpaceGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onClick(index);
              // print(index);
              // print(isTrunOfX);
              // print(gameSpace[index]);
              // print(filledBoxes);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isTrunOfX ? kplayerNameX : kplayerNameO,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  gameSpace[index],
                  style: TextStyle(
                    color: gameSpace[index] == 'X' ? kScoreXclr : kScoreOclr,
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget turnInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          isTrunOfX ? 'Turn of X' : 'Turn of O',
          style: TextStyle(
            fontSize: 20,
            color: isTrunOfX ? kplayerNameX : kplayerNameO,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void onClick(int index) {
    // print('imclicked');
    // print('before: $isTrunOfX'); //debuging
    setState(() {
      if (isTrunOfX && gameSpace[index] == '') {
        gameSpace[index] = 'X';
        // print(gameSpace[index]);
        // print(gameSpace); //debuging
        filledBoxes += 1;
        isTrunOfX = !isTrunOfX;
      } else if (!isTrunOfX && gameSpace[index] == '') {
        gameSpace[index] = 'O';
        filledBoxes += 1;
        isTrunOfX = !isTrunOfX;
      }
      //switching the turn

      // print(isTrunOfX); //debugging
      //checking if someone won or not.
      checkTheWinner();
    });
  }

  checkTheWinner() {
    //for first row
    if (gameSpace[0] == gameSpace[1] &&
        gameSpace[0] == gameSpace[2] &&
        gameSpace[0] != '') {
      gameSpace[0] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[0], 'win');
      //clear board
      return;
    }
    //for second row
    if (gameSpace[3] == gameSpace[4] &&
        gameSpace[3] == gameSpace[5] &&
        gameSpace[3] != '') {
      gameSpace[3] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[3], 'win');
      //clear board
      return;
    }
    //for third row
    if (gameSpace[6] == gameSpace[7] &&
        gameSpace[6] == gameSpace[8] &&
        gameSpace[6] != '') {
      //showdialog(winner(gameSpace[6]));
      gameSpace[6] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[6], 'win');
      //clear board
      return;
    }
    //for first column
    if (gameSpace[0] == gameSpace[3] &&
        gameSpace[0] == gameSpace[6] &&
        gameSpace[0] != '') {
      //showdialog(winner(gameSpace[6]));
      gameSpace[0] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[0], 'win');
      //clear board
      return;
    }
    //for second column
    if (gameSpace[1] == gameSpace[4] &&
        gameSpace[1] == gameSpace[7] &&
        gameSpace[1] != '') {
      //showdialog(winner(gameSpace[6]));
      gameSpace[1] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[1], 'win');
      //clear board
      return;
    }
    //for third column
    if (gameSpace[2] == gameSpace[5] &&
        gameSpace[2] == gameSpace[8] &&
        gameSpace[2] != '') {
      //showdialog(winner(gameSpace[6]));
      gameSpace[2] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[2], 'win');
      //clear board
      return;
    }
    //for diagonals
    if (gameSpace[4] == gameSpace[2] &&
            gameSpace[4] == gameSpace[6] &&
            gameSpace[4] != '' ||
        gameSpace[4] == gameSpace[0] &&
            gameSpace[4] == gameSpace[8] &&
            gameSpace[4] != '') {
      gameSpace[4] == 'X' ? scoreOfX += 1 : scoreOfO += 1;
      showDialog(gameSpace[4].toString(), 'win');
      //clear board
      return;
    }
    if (filledBoxes == 9) {
      showDialog('', 'tie');
    }
    // clearBoard(); //this was my mistake as soon as my gamespace was updating due to the tap, this mf keeps clearing the board ffs.
  }

  clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        gameSpace[i] = '';
      }
      filledBoxes = 0;
      isTrunOfX = true;
    });
  }

  showDialog(String playerName, String winOrTie) {
    return showDialogBox(
      context: context,
      onTap: clearBoard(),
      playerName: playerName,
      winOrTie: winOrTie,
      bgClr: playerName == 'X' ? Colors.green.shade200 : Colors.red.shade100,
      iconBg: playerName == 'X' ? Colors.green.shade800 : Colors.red.shade700,
    );
  }
}
