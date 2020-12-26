import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/screens/login.dart';
import 'package:lovem_a_music_app/utils/constants.dart';
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
 _nextScreen(){
   // Navigator.push(context, MaterialPageRoute(builder:(ctx)=>loginScreen())); // to push next screen over previous but can return to this page
   Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=>loginScreen())); // to push next screen over previous but can't return to this page

 }
 _moveToNextScreen(){
   Future.delayed(Duration(seconds: 5),(){ //to delay some function
     _nextScreen();
   });
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery
        .of(context)
        .size;
    //Portrait Orientation
    if (deviceSize.height > deviceSize.width) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.indigo,
                      Colors.indigoAccent,
                      Colors.lightBlueAccent,
                      Colors.greenAccent
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.network(
                        Constants.introScreenUrl, fit: BoxFit.cover,)
                  ),
                  SizedBox(height: 20,),
                  Text('L O V E M',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("copyright \u00a9 2020 all rights reserved",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 50,),
                  MaterialButton(elevation: 5,
                    padding: EdgeInsets.all(7),

                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                    _nextScreen();
                    },
                    child: Text('Go Further', style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                    ),),)
                ],
              )
            ],
          ),
        ),
      );
    }
    //landscape orientation
    if(deviceSize.width>deviceSize.height){
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.indigo,
                      Colors.indigoAccent,
                      Colors.lightBlueAccent,
                      Colors.greenAccent
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.network(
                        Constants.introScreenUrl, fit: BoxFit.cover,)
                  ),
                  SizedBox(width: 50,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('L O V E M',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),

                      SizedBox(height: 10,),
                    Text("copyright \u00a9 2020 all rights reserved",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                      SizedBox(height: 30,),
                    MaterialButton(elevation: 5,
                    padding: EdgeInsets.all(7),
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      _nextScreen();
                    },
                      child: Text('Go Further', style: TextStyle(
                      fontSize: 25,
                      color: Colors.black54,
                    ),),)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}