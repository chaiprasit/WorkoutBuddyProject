import 'package:flutter/material.dart';
import 'package:workoutbuddyapp/bmi/input_page.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF642B73),
        Color(0xFFC6426E),
      ])),
      padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Activity",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade900.withOpacity(0.8),
                  Colors.blue.shade200.withOpacity(0.9),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 20,
                      color: Colors.blue.shade900.withOpacity(0.2)),
                ]),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 25, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const InputPage()),);
                    },
                    child: Text(
                        "BMI CALCULATOR",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      
                    
                  )
                  
                ],
              ),
            ),
            
          ),
        ],
      ),
    ));
  }


}
