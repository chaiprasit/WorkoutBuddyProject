import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workoutbuddyapp/video_page.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({
    Key? key,
    required this.videoInfo,
  }) : super(key: key);
  String videoInfo;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List workoutdays = [];
  _initData() {
    if (widget.videoInfo == "FULL BODY"){
      DefaultAssetBundle.of(context)
        .loadString("json/fullbody.json")
        .then((value) {
      setState(() {
        workoutdays = json.decode(value);
        
      });
    });
    }
    if (widget.videoInfo == "ABS"){
      DefaultAssetBundle.of(context)
        .loadString("json/abs.json")
        .then((value) {
      setState(() {
        workoutdays = json.decode(value);
        
      });
    });
    }
    if (widget.videoInfo == "ARM"){
      DefaultAssetBundle.of(context)
        .loadString("json/arm.json")
        .then((value) {
      setState(() {
        workoutdays = json.decode(value);
        
      });
    });
    }
    if (widget.videoInfo == "LEG"){
      DefaultAssetBundle.of(context)
        .loadString("json/leg.json")
        .then((value) {
      setState(() {
        workoutdays = json.decode(value);
        
      });
    });
    }
    if (widget.videoInfo == "CHEST"){
      DefaultAssetBundle.of(context)
        .loadString("json/chest.json")
        .then((value) {
      setState(() {
        workoutdays = json.decode(value);
        
      });
    });
    }
    
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF4568dc), Color(0xFFb06ab3)])),
        padding: const EdgeInsets.only(top: 200, left: 30, right: 30),
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(7, (index) {
              return widget.videoInfo == workoutdays[index]["title"]
                  ? Card(
                      elevation: 20.0,
                      margin: EdgeInsets.all(15.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          debugPrint("${workoutdays[index]["time"][0]}");
                        if  (workoutdays[index]["videoId"].length > 0){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPage(videolist: workoutdays[index]["videoId"],time: workoutdays[index]["time"],title: workoutdays[index]["title"])));
                        }
                        
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => VideoPage(videolist: workoutdays[index]["videoId"],)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              // widget.videoInfo
                              "${index + 1}"),
                        ),
                      ),
                    )
                  : Text("");
            })),
      ),
    );
  }
}
