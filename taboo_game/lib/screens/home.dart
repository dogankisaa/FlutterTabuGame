
import 'package:flutter/material.dart';
import 'package:taboo_app/globalVeriable/globalVerabile.dart' as globals;
import 'package:taboo_app/screens/createGame.dart';
import 'package:taboo_app/screens/settings.dart';
import 'package:taboo_app/services/ad.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ams = AdvertService();


  @override



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/backGround.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [settingsButton(), settingsText()],
            ),
            Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [startButton(), startText(),],
            ),

          ],
        ),

      ),
    ));
  }
 IconButton startButton() {
    return IconButton(
      icon: Image.asset('assets/icon/playMain.png'),
       onPressed: ()  {
         startNewGame();
       },
      iconSize: 100,
    );
  }
  startNewGame(){
    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateGame()),
              );
    setState(() {
      globals.aPuan = 0;
      globals.bPuan = 0;
      globals.sayac = true;
    });
  }
   Text startText() => Text(
        "Başla",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );
  
  IconButton settingsButton() {
    return IconButton(
      icon: Image.asset('assets/icon/settings.png'),
      onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              ),
      iconSize: 100,
    );
  }

   Text settingsText() => Text(
        "Ayarlar",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );

  
}
