// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final phone = TextEditingController();

  bool _fullname = false;
  bool _email = false;
  bool _password = false;
  bool _confirmpassword = false;
  bool _phone = false;

  bool isLoading = false;

  void register() async {
    String url = 'http://192.168.1.41:4000/user/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"fullname":"${fullname.text}","email":"${email.text}","password":"${password.text}","phone":"${phone.text}"}';
    var response =
        await http.post(Uri.parse(url), headers: headers, body: json);
    final res = jsonDecode(response.body);
    setState(() {isLoading = false;});
    print(res["message"]);
    if (res["message"] == "success") {
      showDialogWidget(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
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
              height: 250,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(90)),
                  gradient: LinearGradient(colors: [
                    (new Color(0xffF5591F)),
                    (new Color(0xffF2061E))
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                      margin: EdgeInsets.only(
                        right: 20,
                        top: 20,
                      ),
                      alignment: Alignment.bottomRight,
                      child: 
                      Text(
                        "Register",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 58,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: fullname,
                onChanged: (content) {
                  if (content.isEmpty) {
                    setState(() {
                      _fullname = true;
                    });
                  } else {
                    setState(() {
                      _fullname = false;
                    });
                  }
                },
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Full Name",
                  errorText: _fullname ? "Please enter your full name" : null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 58,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content) {
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[com]")
                      .hasMatch(content)) {
                    setState(() {
                      _email = true;
                    });
                  } else {
                    setState(() {
                      _email = false;
                    });
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
                  errorText: _email ? "Please a valid Email" : null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 58,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content) {
                  if (content.isEmpty) {
                    setState(() {
                      _phone = true;
                    });
                  } else {
                    setState(() {
                      _phone = false;
                    });
                  }
                },
                keyboardType: TextInputType.number,
                controller: phone,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Phone Number",
                  errorText: _phone ? "Please enter your phone number" : null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 58,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content) {
                  if (content.isEmpty) {
                    setState(() {
                      _password = true;
                    });
                  } else {
                    setState(() {
                      _password = false;
                    });
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
                  errorText: _password ? "Please enter your password" : null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 58,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                onChanged: (content) {
                  if (content != password.text) {
                    setState(() {
                      _confirmpassword = true;
                    });
                  } else {
                    setState(() {
                      _confirmpassword = false;
                    });
                  }
                },
                controller: confirmpassword,
                obscureText: true,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Confirm Password",
                  errorText:
                      _confirmpassword ? "Password does not match" : null,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {
                setState(() {isLoading = true;}),
                if (password.text == confirmpassword.text)
                  {register()}
                else
                  {
                    setState(() {
                      _confirmpassword = true;
                    })
                  }
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 78),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color(0xffF5591F)),
                    (new Color(0xffF2061E))
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 58,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: isLoading ? CircularProgressIndicator(color: Colors.white):
                Text(
                  "REGISTER",
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
                  Text("Already Member?"),
                  GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xffF5591F)),
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
      title: Text("Register"),
      content: Text("Succeed"),
      actions: [
        TextButton(onPressed: (){
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));

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
