import 'package:flutter/material.dart';

class Options_Page extends StatelessWidget {
  final List<String> Options = <String>['A.', 'B.', 'C.', 'D.'];
  final List<String> Options_1 = <String>[
    'Drone',
    '3D Printer',
    'VR Box',
    'Amazon Alexa'
  ];
  Options_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.separated(
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
                '${Options_1[index]}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.white),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
