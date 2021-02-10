import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymusicstreaming/screens/home.dart';
import 'package:mymusicstreaming/shared/size_config.dart';
//import 'package:fluttertoast/fluttertoast.dart';





class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _loading;

  TextEditingController userNameControler      = TextEditingController();
  TextEditingController passwordControler      = TextEditingController();

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  int _selectedIndex = 0;
  _onSelected(int index){
    setState(() =>
    _selectedIndex = index
    );

  }



  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      controller: userNameControler,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passwordControler,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    final loginButon =
    MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
        onPressed: () {

          //authenticate(userNameControler.text,passwordControler.text);
          // getUser(userNameControler.text,passwordControler.text);

          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Home(adminLogin: true,)));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                gradient: LinearGradient(
                  colors: [
                    Colors.red[500],
                    Colors.red[100],
                    Colors.red[200],
                    Colors.red[300],
                    Colors.red[400],
                    Colors.red[300],
                    Colors.red[200],
                    Colors.red[100],
                    Colors.red[50],
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800],
                    offset: Offset(0.0, 1.5),
                    blurRadius:12,
                  ),
                ]
            ),
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Log In',style: TextStyle(color: Colors.white,fontSize: 20),),

              ],
            )
        )

    );




    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(24, 27, 44, 1),
                  image: new DecorationImage(
                      image: new AssetImage(
                          "lib/assets/images/splashbg.png"),
                      fit: BoxFit.cover)
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: displayHeight(context) * 0.2,
                      child: Image.asset(
                        "lib/assets/images/leerhximgtransparant.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.05),
                    emailField,
                    SizedBox(height: displayHeight(context) * .03),
                    passwordField,

                    SizedBox(
                        height: displayHeight(context) * .03),

                    loginButon,

                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }




}


TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


