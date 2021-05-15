
import 'package:flutter/material.dart';
import 'package:taboo_app/globalVeriable/globalVerabile.dart' as globals;
import 'package:kartal/kartal.dart';
import 'package:taboo_app/screens/currentGame.dart';
import 'package:taboo_app/services/ad.dart';

class CreateGame extends StatefulWidget {
  @override
  _CreateGameState createState() => _CreateGameState();
}

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();

class _CreateGameState extends State<CreateGame> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: context.dynamicWidth(0.9),
                height: context.dynamicHeight(0.5),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          createGameHeaderText(),
                          SizedBox(
                            height: 30,
                          ),
                          aTakimiText(),
                          SizedBox(
                            height: 50,
                          ),
                          bTakimiText()
                        ],
                      ),
                    ),
                  ],
                )),
              ),
              startButton()
            ],
          ),
        ),
      ),
    );
  }

  IconButton startButton() {
    return IconButton(
      icon: Image.asset('assets/icon/playMain.png'),
      onPressed: () => newGame(),
      iconSize: 100,
    );
  }

  newGame() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CurrentGame()),
    );
    if (t1.text == "") {
      globals.aTakimi = "A Takımı";
    } else {
      globals.aTakimi = t1.text;
    }
    if (t2.text == "") {
      globals.bTakimi = "B Takımı";
    } else {
      globals.bTakimi = t2.text;
    }
  }

  Text createGameHeaderText() => Text(
        "Takım Kaydı",
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      );

  TextFormField bTakimiText() => TextFormField(
        controller: t2,
        decoration: InputDecoration(
            labelText: "B Takımı:",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      );

  TextFormField aTakimiText() => TextFormField(
        controller: t1,
        decoration: InputDecoration(
            labelText: "A Takımı:",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      );
}
