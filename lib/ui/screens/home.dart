import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joystick/core/cubit/joy_stick_cubit.dart';
import '../../ui/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // JoyStickCubit cubit = JoyStickCubit.get(context);
    return BlocConsumer<JoyStickCubit, JoyStickState>(
      listener: (context, state) {},
      builder: (context, state) {
        // PageController pageController = PageController(initialPage: 0);
        return Scaffold(
          body: PageView(
            // controller: pageController,
            children:[
              joyStick(context),
              swipeButton(context),
            ]
          ),
        );
      },
    );
  }
}
