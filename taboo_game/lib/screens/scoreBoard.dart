import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:taboo_app/globalVeriable/globalVerabile.dart' as globals;
import 'package:taboo_app/screens/currentGame.dart';

import 'package:taboo_app/screens/home.dart';

import 'package:taboo_app/services/ad.dart';

class ScoreBoard extends StatefulWidget {
  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/backGround.jpg'),
                fit: BoxFit.cover)),
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: globals.aPuan < globals.hedefPuan &&
                          globals.bPuan < globals.hedefPuan
                      ? AssetImage('assets/img/backGround.jpg')
                      : AssetImage('assets/gif/fireworksWin.gif'),
                  fit: BoxFit.cover),
            ),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Container(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      globals.aPuan < globals.hedefPuan &&
                              globals.bPuan < globals.hedefPuan
                          ? oyunaDevamContainer()
                          : oyunSonuContainer(),
                      Container(
                        width: 100,
                          height: 100,


                            child: AdWidget(
                        key: UniqueKey(),
                        ad: AdvertService.createBannerAd()..load(),
                      ),
                          )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Container oyunSonuContainer() {
    return Container(
      child: Column(
        children: [
          winnerNameText(),
          SizedBox(height: 50),
          winnerScoreBoardText(),
          SizedBox(
            height: 30,
          ),
          endOfTheGame()
        ],
      ),
    );
  }

  Container oyunaDevamContainer() {
    return Container(
      child: Column(
        children: [
          puanDurumuText(),
          SizedBox(height: 30),
          scoreBoardContainer(),
          SizedBox(
            height: 30,
          ),
          continueToPlay(),
        ],
      ),
    );
  }

  Text winnerNameText() => Text(
      globals.aPuan < globals.bPuan
          ? "Kazanan: " + globals.bTakimi
          : "Kazanan: " + globals.aTakimi,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white));

  Container winnerScoreBoardText() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: Colors.white,
          border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(globals.aTakimi + ":  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(globals.bTakimi + ":  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(globals.aPuan.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(globals.bPuan.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Text puanDurumuText() => Text("Paun Durumu",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white));

  Container scoreBoardContainer() {
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(globals.aTakimi + ":  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(globals.bTakimi + ":  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(globals.aPuan.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(globals.bPuan.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ))
                ],
              ),
            ],
          )
        ]));
  }

  RaisedButton continueToPlay() {
    return RaisedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CurrentGame()),
        )
      },
      color: Colors.blue[500],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      hoverColor: Colors.black,
      child: Text(
        "Devam Et",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  RaisedButton endOfTheGame() {
    return RaisedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        )
      },
      color: Colors.blue[500],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      hoverColor: Colors.black,
      child: Text(
        "Menü",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
