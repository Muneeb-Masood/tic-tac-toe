import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();

}
Timer? timer1;
int tickCount = 0;
bool winnerXHa = true;


playAudio() async{
  final player = AudioPlayer();
  await player.play(AssetSource("tactactac-103657.mp3"));
  return;
}

class _MainScreenState extends State<MainScreen> {
  // void startTimer(){
  //   timer1  = Timer.periodic(Duration(seconds: 1), (timer) {
  //     tickCount ++;
  //   });
  //   setState(() {
  //
  //   });
  //   if(tickCount==5){
  //     tickCount= 0;
  //     randomTick();
  //   }
  //     startTimer();
  // }

  @override


  bool isWinner = false;
  List<bool> clickedAnswer = List.filled(9, false);
  List<Color> backGroundColors=List.filled(9, Colors.white);
  List<String> images = List.filled(9, "");



void winner(){
  isWinner = true;
  setState(() {

  });
}
  void colorChange(int index1 , int index2 , int index3 , List<Color> colors){
    colors[index1] = Colors.green;
    colors[index2] = Colors.green;
    colors[index3] = Colors.green;
    setState(() {

    });

  }
  Widget meraContainer(int index){
    return
      InkWell(
        onTap: () async{


      if(!isWinner){if (!clickedAnswer[index]) {
            clickedAnswer[index] = true;
            if (Utilities.xKiValue) {
              await playAudio();
              images[index] = "img_2.png";
            } else {
              await playAudio();
              images[index] = "img_3.png";
            }
            Utilities.xKiValue = !Utilities.xKiValue;

            setState(() {});
          }}

            if ((images[0] == images[3]) &&
                (images[3] == images[6]) &&
                images[0] != "") {
              if(images[0]!="img_2"){
                winnerXHa =false;
              }

              colorChange(0, 3, 6, backGroundColors);
              winner();
            } else if ((images[0] == images[1]) &&
                (images[1] == images[2]) &&
                images[0] != "") {
              if(images[0]!="img_2"){
                winnerXHa =false;
              }

              colorChange(0, 1, 2, backGroundColors);
              winner();
            } else if ((images[2] == images[4]) &&
                (images[4] == images[6]) &&
                images[2] != "") {
              if(images[2]!="img_2"){
                winnerXHa =false;
              }

              colorChange(2, 4, 6, backGroundColors);
              winner();
            } else if ((images[0] == images[4]) &&
                (images[4] == images[8]) &&
                images[0] != "") {
              if(images[0]!="img_2"){
                winnerXHa =false;
              }

              colorChange(0, 4, 8, backGroundColors);
              winner();
            }
            else if ((images[1] == images[4]) &&
                (images[4] == images[7]) &&
                images[1] != "") {
              if(images[1]!="img_2"){
                winnerXHa =false;
              }

              colorChange(1, 4, 7, backGroundColors);
              winner();
            }
            else if ((images[6] == images[7]) &&
                (images[6] == images[8]) &&
                images[6] != "") {
              if(images[6]!="img_2"){
                winnerXHa =false;
              }

              colorChange(6, 7, 8, backGroundColors);
              winner();
            } else if ((images[2] == images[5]) &&
                (images[2] == images[8]) &&
                images[2] != "") {
              if(images[2]!="img_2"){
                winnerXHa =false;
              }

              winner();
              colorChange(2, 5, 8, backGroundColors);
            } else if ((images[3] == images[4]) &&
                (images[4] == images[5]) &&
                images[3] != "") {
              if(images[3]!="img_2"){
                winnerXHa =false;
              }

              colorChange(3, 4, 5, backGroundColors);
              winner();
            }

      },
        child: Container(

          child: clickedAnswer[index] ==true
              ? Image.asset(images[index])
              : null,
          decoration: BoxDecoration(
            color: backGroundColors[index],
            border: Border(
              top: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset(
              "img_4.png",
              fit: BoxFit.fill,
            ),
          ),

          Positioned(
            top: 100,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
    (isWinner )?(Utilities.player1Selected)?"Player X wins":"Player O wins":"Player ${Utilities.xKiValue ? 1 : 2}'s Turn"
                ,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),
          Container(
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              top: 220,
              left: 18,
              right: 18,
            ),
            padding: EdgeInsets.all(17),
            child:
            GridView.count(
              crossAxisCount: 3,
             children: [
               meraContainer(0),
               meraContainer(1),
               meraContainer(2),
               meraContainer(3),
               meraContainer(4),
               meraContainer(5),
               meraContainer(6),
               meraContainer(7),
               meraContainer(8),
             ],
            ),

          ),
        ],
      ),
    );
  }
}






