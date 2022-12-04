import 'package:flutter/material.dart';
import 'package:full_function_game/main.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
          navigateRoute: MyApp(),
          duration: 1500,
          imageSize: 130,
          text: 'QuizApp',
          speed: 100,
          textType: TextType.ColorizeAnimationText,
          textStyle: TextStyle(
            fontSize: 40.0,
          ),
          colors: [
            Colors.indigo,
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.orange,
            Colors.red,
          ],
          backgroundColor: Colors.black87),
    );
  }
}
