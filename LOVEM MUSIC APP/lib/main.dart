import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lovem_a_music_app/models/User.dart';
import 'package:lovem_a_music_app/screens/artistDetails.dart';
import 'package:lovem_a_music_app/screens/intro_screen.dart';
void main() async{ //to use await we need to make it asynchronouss
  WidgetsFlutterBinding.ensureInitialized(); //ensures firebase is initialized
  await Firebase.initializeApp(); //to initialize firebase , since it returns future then we have to use await
  runApp(MaterialApp(
    title:'LOVEM',
    debugShowCheckedModeBanner: false,
    // home:ArtistDetails(user)
    home: IntroScreen(),
  ));
}
