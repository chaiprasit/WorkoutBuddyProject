import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workoutbuddyapp/login_screen.dart';
import 'package:workoutbuddyapp/luncher_Page.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();

  
}

class InitState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 3);
    return new Timer(duration,checkLogin);
  }

  loginRoute() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
      ));
  }

  void checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('data');
    // Map<String, dynamic> payload = Jwt.parseJwt(data.toString());
    if(data != null){
      Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => Luncher()
      ));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
      ));
    }
    // print(payload);
  }
  
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0XFFf5591F),
              gradient: LinearGradient(
                colors: [(new Color(0XFFf5591F)), (new Color(0xffF2861E))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            )
          ),
          Center(
            child: Container(
              child: Image.asset("assets/ex1.png"),
            ),
          )
        ],
      ),
    );
  }
  
}