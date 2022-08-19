import 'package:joystick/core/utils/pie_design.dart';

import '../../../core/constants.dart';

PieChartData pieChartPiece(idx){
  return PieChartData(
      index == idx
          ? selectedColors[idx]
          : unSelectedColors[idx]!,
      25);
}