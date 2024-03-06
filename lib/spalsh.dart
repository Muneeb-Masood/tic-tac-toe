import 'package:concept_making/mainScreen.dart';
import 'package:concept_making/utilities.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            
            height: MediaQuery.of(context).size.height*1,
            width:MediaQuery.of(context).size.width*1,

            child:  Image.asset("img_4.png", fit: BoxFit.fill),
          ),

          Positioned(
            top: 120,
            left: 20,
            child: Container(
              child: Text("Tic-Tac-Toe", style: TextStyle(
                  fontSize: 40,
                  fontFamily: "MontSerrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              )),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: 80,
            left: -50,
            child: Image.asset("img_5.png", width: 220,),
          ),
          Positioned(
            top: 30,
            right: -80,
            child: Image.asset("img_6.png", width: 220,),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width:MediaQuery.of(context).size.width*1,
              // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pick who goes first?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(child: Image.asset("img_2.png"),
                        onTap: (){
                          Utilities.xKiValue = true;

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));

                        },),
                      ),
                      Expanded(
                        child: InkWell(onTap: (){
                          Utilities.player1Selected = false;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));

                        },child: Image.asset("img_3.png")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
