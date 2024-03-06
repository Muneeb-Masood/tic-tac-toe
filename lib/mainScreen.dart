import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<bool> clickedAnswer = List.filled(9, false);
  List<String> images = List.filled(9, "");
  bool xKiTurn = true;
  ConfettiController controller = ConfettiController(duration: Duration
    (seconds: 5));

  Widget meraContainer(int index){
    return
      InkWell(
        onTap: () {
          if(images[0]==images[3] && images[5]==images[6] && images[0]!=""){
            images[0]=="img_2.png"?print("X wins"):print("O wins");
            ConfettiWidget(
              confettiController: ConfettiController(),
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.05,
              shouldLoop: false, // Confetti stops after firing once
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // Specify custom colors for confetti
            );
          }


          else if(images[0]==images[1] && images[1]==images[2] &&
              images[0]!=""){
            images[0]=="img_2.png"?print("X wins"):print("O wins");
          }


          else if(images[0]==images[3] && images[3]==images[6] &&
              images[0]!=""){
            images[0]=="img_2.png"?print("X wins"):print("O wins");
          }

          else if(images[0]==images[4] && images[4]==images[8] &&
              images[0]!=""){
            images[0]=="img_2.png"?print("X wins"):print("O wins");
          }

          else if(images[6]==images[7] && images[6]==images[8] &&
              images[6]!=""){
            images[6]=="img_2.png"?print("X wins"):print("O wins");
          }

          else if(images[2]==images[5] && images[2]==images[8] &&
              images[2]!=""){
            images[2]=="img_2.png"?print("X wins"):print("O wins");
          }

          else if(images[3]==images[4] && images[4]==images[5] &&
              images[3]!=""){
            images[3]=="img_2.png"?print("X wins"):print("O wins");
          }
          // || images[0]==images[1] && images[1]==images[2]
          // ||
          // ||
          // ||
          // || ){
          //   if(images[0] == "img_2.png"){
          //     print("Player x wons");
          //   }
          // }
          if(!clickedAnswer[index]){

          clickedAnswer[index] = true;
          if(xKiTurn){
            images[index] = "img_2.png";
          }

          else{
            images[index] = "img_3.png";
          }
          xKiTurn = !xKiTurn;


          setState(() {

          });
        }},
        child: Container(
          child: clickedAnswer[index] ==true
              ? Image.asset(images[index])
              : null,
          decoration: BoxDecoration(
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
            left: 90,
            child: Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                "Player ${xKiTurn ? 1 : 2}'s Turn",
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
            height: 245,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              top: 220,
              left: 18,
              right: 18,
            ),
            padding: EdgeInsets.all(22),
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
