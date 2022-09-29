import 'package:workoutbuddyapp/activity_page.dart';
import 'package:workoutbuddyapp/bmi/input_page.dart';
import 'package:workoutbuddyapp/edit_profile.dart';
import 'package:workoutbuddyapp/homepage.dart';
import 'package:workoutbuddyapp/signup_screen.dart';



import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Luncher extends StatefulWidget {
  const Luncher({Key? key}) : super(key: key);

  @override
  _LuncherState createState() => _LuncherState();
}

class _LuncherState extends State<Luncher> {
  int pageIndex = 0;
  List<Widget> widgetList =  [
    HomePage(),
    InputPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: widgetList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'BMI CALCULATOR',
          ),
        ],
      ),
    );
  }
}
