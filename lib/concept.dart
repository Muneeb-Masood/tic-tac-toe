import 'dart:async';

import 'package:flutter/material.dart';

class Concept extends StatefulWidget {
  const Concept({Key? key}) : super(key: key);

  @override
  State<Concept> createState() => _ConceptState();
}

class _ConceptState extends State<Concept> {
  late Timer timer1;
  int tickCount = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        tickCount++;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.red,
            child: Text(tickCount.toString()),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                tickCount = 0;
                timer1.cancel();
                startTimer();
              });
            },
            child: Text("Reset Timer"),
          )
        ],
      ),
    );
  }
}
