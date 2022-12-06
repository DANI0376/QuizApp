import 'package:flutter/material.dart';
import 'package:full_function_game/q&a.dart';
import 'package:full_function_game/result_page.dart';

class Home_Page extends StatefulWidget {
  Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<String> Options = <String>['A.', 'B.', 'C.', 'D.'];

  final List<String> Options_1 = <String>[
    'Drone',
    '3D Printer',
    'VR Box',
    'Amazon Alexa'
  ];
  int pageindex = 1;
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
                    '$pageindex/10',
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
                datas['questions'][pageindex]['question'],
               
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
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                      leading: Text(
                        '${Options[index]}',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      title: Text(
                        datas['questions'][pageindex]['answers'][index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9))),
                      onPressed: (() {
                        setState(() {
                          pageindex < 10
                              ? pageindex++
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Result_page()));
                        });
                      }),
                      child: Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.blue)
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
