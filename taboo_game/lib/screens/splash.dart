import 'package:flutter/material.dart';


import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6), () async {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(121, 112, 234, 1),
        child: Center(child: Image.asset('assets/gif/loading.gif')),
      ),
    );
  }
}
