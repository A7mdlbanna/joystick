import 'package:flutter/material.dart';
import 'package:touch_indicator/touch_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/joy_stick_cubit.dart';
import 'ui/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoyStickCubit(),
      child: BlocConsumer<JoyStickCubit, JoyStickState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'joystick',
            builder: (context, child) => TouchIndicator(child: child!),
            theme: ThemeData.dark(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
