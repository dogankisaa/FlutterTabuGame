import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taboo_app/globalVeriable/globalVerabile.dart' as globals;
import 'package:kartal/kartal.dart';
import 'package:taboo_app/screens/scoreBoard.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:taboo_app/list/wordList.dart' as globals;

class CurrentGame extends StatefulWidget {
  @override
  _CurrentGameState createState() => _CurrentGameState();
}

class _CurrentGameState extends State<CurrentGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/backGround.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
              timerText(),
              globals.sayac ? aTakimSkor() : bTakimSkor(),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: context.dynamicWidth(0.8),
                  height: context.dynamicHeight(0.4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      greenGameText(),
                      Divider(),
                      redGameText(1),
                      Divider(),
                      redGameText(2),
                      Divider(),
                      redGameText(3),
                      Divider(),
                      redGameText(4),
                      Divider(),
                      redGameText(5),
                    ],
                  ))),
              SizedBox(
                height: context.dynamicHeight(0.1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  falseAnswerButton(context),
                  passButton(context),
                  trueAnswerButton(context)
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  Text bTakimSkor() => Text(
        globals.bTakimi + ": " + globals.bPuan.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20),
      );

  Text aTakimSkor() => Text(
        globals.aTakimi + ": " + globals.aPuan.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20),
      );

  IconButton trueAnswerButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icon/check.png'),
      onPressed: () => trueAnswer(),
      iconSize: 100,
    );
  }

  IconButton passButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icon/pass.png'),
      onPressed: () => passTheAnswer(),
      iconSize: 100,
    );
  }

  IconButton falseAnswerButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/icon/cancel.png'),
      onPressed: () => falseAnswer(),
      iconSize: 100,
    );
  }

  Countdown timerText() {
    return Countdown(
      seconds: globals.sure,
      build: (BuildContext context, double time) => Text(
        time.toInt().toString(),
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      interval: Duration(seconds: 1),
      onFinished: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScoreBoard()),
        );
        setState(() {
          globals.sayac = !globals.sayac;
        });
      },
    );
  }

  Text greenGameText() {
    return Text(globals.words[globals.num][0].toString(),
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 40));
  }

  Text redGameText(int index) {
    return Text(globals.words[globals.num][index].toString(),
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30));
  }

  trueAnswer() {
    Random rnd = new Random();
    globals.num = rnd.nextInt(globals.words.length);
    setState(() {
      if (globals.sayac) {
        globals.aPuan++;
      } else {
        globals.bPuan++;
      }
    });
  }

  falseAnswer() {
    Random rnd = new Random();
    globals.num = rnd.nextInt(globals.words.length);
    setState(() {
      if (globals.sayac) {
        globals.aPuan -= globals.cezaPuan;
      } else {
        globals.bPuan -= globals.cezaPuan;
      }
    });
  }

  passTheAnswer() {
    Random rnd = new Random();
    globals.num = rnd.nextInt(globals.words.length);
    setState(() {
      
    });
  }
}
