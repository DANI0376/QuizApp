import 'package:flutter/cupertino.dart';
import 'package:full_function_game/hone_page.dart';
import 'package:full_function_game/q&a.dart';

late bool match;
int mark = 0;

class ProviderPage extends ChangeNotifier {
  void pageChange() {
    if (match) {
      mark++;
    }
    notifyListeners();
  }

  void answercheck(int buttonindex, pageindex, int index) {
    buttonindex = index;
    buttonindex == datas['questions'][pageindex]['correctIndex']
        ? match = true
        : match = false;
    print(match);
    print(pageindex);
    notifyListeners();
  }
}
