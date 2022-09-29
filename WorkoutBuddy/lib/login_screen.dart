// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:workoutbuddyapp/luncher_Page.dart';
import 'homepage.dart';
import 'signup_screen.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool _email = false;
  bool _password = false;
  bool isLoading = false;

  void login() async {
    String url = 'http://192.168.1.41:4000/user/login'; 
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"email":"${email.text}","password":"${password.text}"}';
    var response =
        await http.post(Uri.parse(url), headers: headers, body: json);
    final res = jsonDecode(response.body);
    setState(() {isLoading = false;});
    print(res["data"]);
    if (res["message"] == "success") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('data', res["data"].toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Luncher()));
    }
    else {
      showDialogWidget(context);
    }
 
  }

  void checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('data');
    Map<String, dynamic> payload = Jwt.parseJwt(data.toString());
    print(payload);
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }




  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color(0XFFf5591F),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset("assets/ex1.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 20, top: 20, ),
                      child: Text(
                        "Workout Buddy",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content){
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]").hasMatch(content)){
                    setState(() {_email=true;});    
                    }
                  else {
                    setState(() {_email=false;});
                  }
                  
                },
                controller: email,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email, 
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Email",
                  errorText: _email? "Please a valid Email": null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right:20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content){
                  if(content.isEmpty){
                    setState(() {_password = true;});
                  }
                  else {
                    setState(() {_password=false;});
                  }
                  
                },
                controller: password,
                obscureText: true,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key, 
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Password",
                  errorText: _password? "Please enter your password": null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10,right: 20,),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forget Password?"),
                onTap: () => {

                },
              ),
            ),
            GestureDetector(
              onTap: () => {
                setState(() {isLoading = true;}),
                login()

              },    
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 78),
                padding: EdgeInsets.only(left: 20, right: 20,),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [(new Color(0xffF5591F)), (new Color(0xffF2061E))],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                    ),
                  borderRadius: BorderRadius.circular(50),  
                  boxShadow: [BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 58,
                  color: Color(0xffEEEEEE)
                )], 
                ),
                child: isLoading ? CircularProgressIndicator(color: Colors.white): 
                Text("Login",
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
                
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't Have Account?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SignUpScreen()
                      ))
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xffF5591F)
                      ),
                      ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogWidget(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Text("Login"),
      content: Text("Please check your password."),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context, false);

        }, child: Text("OK"),),
        
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      }
    );
  }
  
}