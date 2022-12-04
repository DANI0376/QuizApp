import 'package:flutter/material.dart';
import 'package:full_function_game/containers.dart';
import 'package:full_function_game/splash_screen.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            children: [
              // Icon(Icons.arrow_back),
              SizedBox(
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Quiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    '1/10',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 40),
            child: Container(
              child: Text(
                'Which of the following\ntechnology used by zomato for\nfood delivery ??',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.grey, spreadRadius: 2)
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25.0,
              child: Icon(Icons.question_mark),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Center(
              child: Text(
            'Choose an Answer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.grey[500]),
          )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 250,
              width: 350,
              child: ContainersPage(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300),
                child: Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: TextButton.icon(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen())),
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Next')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
