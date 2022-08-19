import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget swipeButton(context){
  late var dy;
  double containerWidth = 100, containerHeight = 70;
  late double start;
  bool? down;
  double screenWidth = MediaQuery.of(context).size.width,
         screenHeight = MediaQuery.of(context).size.height;
  return GestureDetector(
    onPanStart: (details){
      print("start");
      start = details.globalPosition.dy;
    },
    onPanUpdate: (details){
      if(start < screenHeight/2 - containerHeight/2) {
        // print("update");
        if (details.globalPosition.dy > screenHeight / 2 - containerHeight / 2 &&
            details.globalPosition.dy < screenHeight / 2 + containerHeight / 10 &&
            details.globalPosition.dx > screenWidth / 2 - containerWidth / 2 &&
            details.globalPosition.dx < screenWidth / 2 + containerWidth / 2) {
          print("down");
          // Fluttertoast.showToast(msg: "Down");
          down = true;
        }
      }else if(start > screenHeight/2 + containerHeight/2) {
        // print("update2");
        if (details.globalPosition.dy < screenHeight / 2 + containerHeight / 2 &&
            details.globalPosition.dy > screenHeight / 2 + containerHeight / 10 &&
            details.globalPosition.dx > screenWidth / 2 - containerWidth / 2 &&
            details.globalPosition.dx < screenWidth / 2 + containerWidth / 2) {
          print("up");
          // Fluttertoast.showToast(msg: "Up");
          down = false;
        }
      }
      // print(down.toString());

      // print(details.globalPosition.dy.toString() + " : " + details.globalPosition.dx.toString());
    },
    onPanEnd: (d){
      down == null ? null : Fluttertoast.showToast(msg: down! ? "Down" : "Up");
      down = null;
      },
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color:Colors.transparent,
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 100, height: 70,
              color: Colors.teal,
            ),
          ],
        ),
      ),
    ),
  );
}