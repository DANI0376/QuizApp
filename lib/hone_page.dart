import 'package:flutter/material.dart';
import 'package:full_function_game/fetchdata.dart';
import 'package:full_function_game/provider_page.dart';
// import 'package:full_function_game/q&a.dart';
import 'package:full_function_game/result_page.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatelessWidget {
  Home_Page({super.key});

  final List<String> Options = <String>['A.', 'B.', 'C.', 'D.'];
  int pageindex = 1;
  int buttonindex = -1;
  int indexfornextquestion = 0;
  int indexfornextanswer = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(builder: (context, pro, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Row(
              children: [
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
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      '$pageindex/10',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 40),
              child: Container(
                  child: FutureBuilder(
                future: fetchQuestion(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data![0].questions[indexfornextquestion].question}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
              )),
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
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                          color:
                              index == buttonindex ? Colors.green : Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        onPressed: () {
                          buttonindex = index;

                          pro.answercheck(buttonindex, pageindex, index);
                        },
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              '${Options[index]}',
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                          ),
                          title: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16, left: 20),
                              child: FutureBuilder(
                                future: fetchQuestion(),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data![0].questions[indexfornextquestion].answers[index]}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: Colors.white),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                }),
                              )
                              // child: Text(
                              //   datas['questions'][pageindex]['answers'][index],
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 19,
                              //       color: Colors.white),
                              // ),
                              ),
                        ),
                      ),
                    );
                  },
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
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 10,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        onPressed: (() {
                          pro.pageChange();
                          pageindex < 10
                              ? pageindex++
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                      context.read<ProviderPage>().mark)));
                          buttonindex = -1;
                          indexfornextquestion++;
                          print('totalmark' +
                              context.read<ProviderPage>().mark.toString());
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
    });
  }
}
