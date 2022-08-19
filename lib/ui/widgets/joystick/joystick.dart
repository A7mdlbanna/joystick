import 'package:flutter/material.dart';
import 'package:joystick/core/utils/pie_design.dart';

import 'pie_chart_piece.dart';
import '../../../core/constants.dart';
import '../../../core/cubit/joy_stick_cubit.dart';

Widget joyStick(context){
  JoyStickCubit cubit = JoyStickCubit.get(context);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      // Here is the two circles...
      Center(
        child: PieChart(
          data: [
            pieChartPiece(1),
            pieChartPiece(3),
            pieChartPiece(7),
            pieChartPiece(5),
          ],
          radius: 140,
          child: Center(
            child: PieChart(
              data: [
                pieChartPiece(0),
                pieChartPiece(2),
                pieChartPiece(6),
                pieChartPiece(4),
              ],
              radius: 80,

              // I made a GestureDetector to detect the Position of the finger using onPan() methods
              child: GestureDetector(
                onPanUpdate: (details) {
                  var dx = details.localPosition.dx - containerSize / 2,
                      dy = details.localPosition.dy - containerSize / 2;
                  bool isInner = dx.abs() + dy.abs() < 140;

                  //  This is the logic.. Don't mind about it...
                  if (dx.abs() + dy.abs() > 60) {
                    // if(index == 8) {
                    if (dx < 0 && dy < 0 && (index == 0 || isFirst)) {
                      isInner ? idx = 0 : idx = 1;
                      isFirst = false;
                    } else if (dx > 0 &&
                        dy < 0 &&
                        (index == 2 || isFirst)) {
                      idx = isInner ? 2 : 3;
                      isFirst = false;
                    } else if (dx < 0 &&
                        dy > 0 &&
                        (index == 4 || isFirst)) {
                      idx = isInner ? 4 : 5;
                      isFirst = false;
                    } else if (dx > 0 &&
                        dy > 0 &&
                        (index == 6 || isFirst)) {
                      idx = isInner ? 6 : 7;
                      isFirst = false;
                    }
                    // }
                  } else {
                    idx = 8;
                    isFirst = true;
                  }
                  // here i just add the word to the list and change the index which changes the color.
                  JoyStickCubit.get(context).setIndex(idx);
                },
                // if the user removed his finger i delete the list of words and set the color to default
                onPanEnd: (d) {
                  debugPrint("on-pan-cancel");
                  cubit.panEnd();
                },
                child: Container(
                  width: containerSize,
                  height: containerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selectedColors[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 80,),
      Container(
        decoration: BoxDecoration(
          color: selectedColors[index],
        ),
        child: Center(
            child: Text(
              words.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )
        ),
      ),
    ],
  );
}