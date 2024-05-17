import 'package:flutter/material.dart';

class MyAppSize {
  static final MyAppSize _instance = MyAppSize._internal();

  // passes the instantiation to the _instance object
  factory MyAppSize() => _instance;

  //initialize variables in here
  MyAppSize._internal();

  double _width = 0.0;
  double _height = 0.0;
  bool isFinish = false;

  double get appHeight => _height;
  double get appWidth => _width;

  //short setter for my variable
  set setMyWidth(double newWidth) {
    _width = newWidth;
    isFinish = true;
  }

  set setMyHeight(double newHeight) {
    _height = newHeight;
    isFinish = true;
  }
}
