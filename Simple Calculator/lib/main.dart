import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
   theme: ThemeData.light(),
   title: "Simple Calculator Made by Ahsan",
    debugShowCheckedModeBanner: false,
    home: simpleCalculator(),
  ));
}