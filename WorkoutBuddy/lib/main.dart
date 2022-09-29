import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workoutbuddyapp/activity_page.dart';
import 'package:workoutbuddyapp/bmi/input_page.dart';
import 'package:workoutbuddyapp/edit_profile.dart';
import 'package:workoutbuddyapp/splash_screen.dart';
import 'package:workoutbuddyapp/video_page.dart';
import 'package:workoutbuddyapp/workout_page.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
