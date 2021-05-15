import 'dart:math';

import 'package:taboo_app/list/wordList.dart' as globals;

String aTakimi = "A Takımı";
String bTakimi = "B Takımı";
int aPuan = 0;
int bPuan = 0;
int hedefPuan = 25;
int cezaPuan = 1;
int sure = 5;
bool sayac = true;
bool reklamSayaci = true;

Random rnd = new Random();
int num = rnd.nextInt(globals.words.length - 1);
