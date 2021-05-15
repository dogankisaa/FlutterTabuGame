import 'package:flutter/material.dart';
import 'package:taboo_app/globalVeriable/globalVerabile.dart' as globals;
import 'package:taboo_app/screens/home.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  double sureSlider = 60;
  double puanSlider = 20;
  double cezaSlider = 1;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  sliderValueText("Süre", sureSlider),
                  sureSliderWidget(),
                  SizedBox(height: 50),
                  sliderValueText("Hedef Puan", puanSlider),
                  puanSliderWidget(),
                  SizedBox(height: 50),
                  sliderValueText("Tabu", cezaSlider),
                  cezaSliderWidget(),
                  SizedBox(height: 20),
                  setinConfirmButton(),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  settingsConfirm() {
    if (sureSlider != 60) {
      globals.sure = sureSlider.toInt();
    }
    if (puanSlider != 20) {
      globals.hedefPuan = puanSlider.toInt();
    }
    if (cezaSlider != 1) {
      globals.cezaPuan = cezaSlider.toInt();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  RaisedButton setinConfirmButton() {
    return RaisedButton(
      onPressed: () => settingsConfirm(),
      color: Colors.blue[500],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      hoverColor: Colors.black,
      child: Text(
        "Onayla",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Text sliderValueText(String label, double value) => Text(
        label + ": " + value.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20),
      );

  Slider sureSliderWidget() {
    return Slider(
      value: sureSlider,
      min: 60,
      max: 180,
      divisions: 4,
      activeColor: Colors.orange,
      inactiveColor: Colors.blue,
      label: sureSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          sureSlider = value;
          value = globals.sure.toDouble();
        });
      },
    );
  }

  Slider puanSliderWidget() {
    return Slider(
      value: puanSlider,
      min: 20,
      max: 60,
      divisions: 4,
      activeColor: Colors.orange,
      inactiveColor: Colors.blue,
      label: puanSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          puanSlider = value;
          value = globals.hedefPuan.toDouble();
        });
      },
    );
  }

  Slider cezaSliderWidget() {
    return Slider(
      value: cezaSlider,
      min: 1,
      max: 5,
      divisions: 4,
      activeColor: Colors.orange,
      inactiveColor: Colors.blue,
      label: cezaSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          cezaSlider = value;
          value = globals.cezaPuan.toDouble();
        });
      },
    );
  }
}
