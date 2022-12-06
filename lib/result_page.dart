import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:full_function_game/hone_page.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool win = mark >= 5;

class Result_page extends StatelessWidget {
  const Result_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text(
            'Result',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Stack(
        children: [
          win
              ? LottieBuilder.network(
                  'https://assets4.lottiefiles.com/private_files/lf30_f495l0im.json')
              : LottieBuilder.network(
                  'https://assets4.lottiefiles.com/private_files/lf30_f495l0im.json'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 550),
                  child: CircularPercentIndicator(
                      radius: 80,
                      animation: true,
                      animationDuration: 1200,
                      lineWidth: 15,
                      percent: mark / 10,
                      center: new Text(
                        "$mark/10",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      progressColor: win ? Colors.green : Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
