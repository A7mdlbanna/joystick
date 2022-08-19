import 'package:flutter/material.dart';

int index = 8;
bool up = false;
bool isFirst = true;
late int idx;

double containerSize = 70;



  List<Color> selectedColors = [
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.orange,
    Colors.teal,
    Colors.red,
    Colors.white,
  ];
  List<Color?> unSelectedColors = [
    Colors.green[200],
    Colors.purple[200],
    Colors.yellow[200],
    Colors.blue[200],
    Colors.brown[200],
    Colors.orange[200],
    Colors.teal[200],
    Colors.red[200],
  ];

  List<String> words = [];
