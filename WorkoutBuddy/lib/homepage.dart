// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workoutbuddyapp/workout_page.dart';

import 'login_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF4568dc), Color(0xFFb06ab3)])),
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Workout Buddy",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showDialogWidget(context);
                    },
                    child: Icon(Icons.logout_outlined,
                        size: 30, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    "Traininng",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Expanded(child: Container()),
                  // Text(
                  //   "Details",
                  //   style: TextStyle(
                  //       fontSize: 20,
                  //       color: Colors.blue.shade900,
                  //       fontWeight: FontWeight.w400),
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(() => ViedeoInfo());
                  //   },
                  //   child: Icon(Icons.arrow_forward,
                  //       size: 20, color: Colors.black),
                  // )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Text(
                  "Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ]),
              Expanded(
                  child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: info.length,
                      itemBuilder: (_, int training) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WorkoutPage(
                                              videoInfo: info[training]
                                                  ["title"],
                                            )));
                                debugPrint(info[training]["title"]);
                              },
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 70),
                                height: 150,
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 15, top: 15),
                                padding: EdgeInsets.only(
                                    bottom: 10, left: 200, top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(info[training]['img'])),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(10, 10),
                                          color: Colors.black.withOpacity(0.1)),
                                      BoxShadow(
                                          blurRadius: 3,
                                          offset: Offset(-5, -5),
                                          color: Colors.blue.shade900
                                              .withOpacity(0.1)),
                                    ]),
                                child: Center(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    info[training]["title"],
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                )),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              )),
            ],
          )),
    );
  }

  showDialogWidget(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("You want to log out?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            logout();
          },
          child: Text("Log Out"),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
