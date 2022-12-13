import 'package:flutter/cupertino.dart';
import 'package:full_function_game/q&a.dart';

class ProviderPage extends ChangeNotifier {
  bool match = false;
  int mark = 0;
  void answercheck(int buttonindex, pageindex, int index) {
    buttonindex = index;
    buttonindex == datas['questions'][pageindex]['correctIndex']
        ? match = true
        : match = false;
    print(match);
    print(pageindex);
    notifyListeners();
  }

  void pageChange({bool reset = false}) {
    if (match) {
      mark++;
      match = false;
    }
    notifyListeners();
  }
}
