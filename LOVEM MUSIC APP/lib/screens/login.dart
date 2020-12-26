import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/custom%20widgets/customLoginButton.dart';
import 'package:lovem_a_music_app/helpers/gmail_auth.dart';
import 'package:lovem_a_music_app/models/User.dart'; //this is used to avoid importing heavy package firebase_auth everywhere
import 'package:lovem_a_music_app/screens/artistDetails.dart';
import 'package:lovem_a_music_app/utils/constants.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}


Widget loginText(String text){
  return Text(text,style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold));
}

class _loginScreenState extends State<loginScreen> {


  isAuthenticate(Future<auth.User> future){
    future.then((auth.User firebaseUser) {
      User user = new User();
      user.email=firebaseUser.email;
      user.name=firebaseUser.displayName;
      user.image=firebaseUser.photoURL;
      print(firebaseUser.email);
      print(firebaseUser.displayName);
      print(firebaseUser.photoURL);
      Navigator.push(context, MaterialPageRoute(builder: (ct)=>ArtistDetails(user)));
    }).catchError((err){print("Login Error : $err");});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    if (deviceSize.height>deviceSize.width)
    return Scaffold(
       body: SafeArea(
         child: Stack(
           children: [Container(
             color: Colors.indigo,
           ),
             Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image:NetworkImage(Constants.loginScreenBackgroundImage),
                     fit:BoxFit.cover
                 )
               ),
             ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                loginText("Login using"),
                SizedBox(height: deviceSize.height * 0.05,),
                CustomLoginButton(GmailAuth.login,Constants.googleLogo,"Google",isAuthenticate),
                SizedBox(
                  height: deviceSize.height * 0.05,
                ),
                // loginText("Or"),
                // SizedBox(height: deviceSize.height * 0.05,),
                // CustomLoginButton(GmailAuth.login,Constants.facebookLogo,"Facebook",isAuthenticate),
              ],
            ),
          )
           ],
         )
       )
    );
    if (deviceSize.height<deviceSize.width)
      return Scaffold(
          body: SafeArea(
              child: Stack(
                children: [Container(
                  color: Colors.indigo,
                ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:NetworkImage(Constants.loginScreenBackgroundImage),
                            fit:BoxFit.cover
                        )
                    ),
                  ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loginText("Login using"),
                        SizedBox(height: deviceSize.height * 0.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            CustomLoginButton(GmailAuth.login,Constants.googleLogo,"Google",isAuthenticate),
                            SizedBox(
                              width: deviceSize.width * 0.05,
                            ),
                            // loginText("Or"),
                            // SizedBox(width: deviceSize.height * 0.05,),
                            // CustomLoginButton(GmailAuth.login,Constants.facebookLogo,"FACEBOOK",isAuthenticate),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
          )
      );
    }
  }

