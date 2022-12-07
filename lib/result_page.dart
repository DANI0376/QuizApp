import 'package:flutter/material.dart';
import 'package:full_function_game/hone_page.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Result_page extends StatelessWidget {
  final int totalmark;
  Result_page(this.totalmark);
  @override
  Widget build(BuildContext context) {
    bool win = mark >= 5;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text(
              'Result',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        body: Stack(
          children: [
            win
                ? Center(
                    child: LottieBuilder.network(
                        'https://assets1.lottiefiles.com/packages/lf20_zmzsqn3b.json'),
                  )
                : Center(
                    child: LottieBuilder.network(
                        "https://assets9.lottiefiles.com/private_files/lf30_GjhcdO.json"),
                  ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 400),
                    child: CircularPercentIndicator(
                      animation: true,
                      // animationDuration: 1000,
                      radius: 85,
                      lineWidth: 20,
                      percent: mark / 10,
                      center: Text(
                        "${mark}/10",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      progressColor: win ? Colors.green : Colors.red,
                      backgroundColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: FloatingActionButton.extended(
                        backgroundColor: win
                            ? Colors.lightGreen
                            : Color.fromARGB(255, 247, 150, 4),
                        onPressed: (() {
                          mark = 0;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => Home_Page()));
                        }),
                        label: win
                            ? Text(
                                "Awesome",
                                style: TextStyle(fontSize: 20),
                              )
                            : Text(
                                'Oooops.....!',
                                style: TextStyle(fontSize: 20),
                              )),
                  ),
                  win
                      ? Text(
                          '\t\t\t\t\t\t\tcongratulation\nYou Passed The exam ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      : TextButton(
                          onPressed: (() {
                            mark = 0;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => Home_Page()));
                          }),
                          child: Text(
                            'try again',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                ],
              ),
            )
          ],
        ));
  }
}
