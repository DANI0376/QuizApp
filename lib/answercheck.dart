import 'package:full_function_game/hone_page.dart';
import 'package:full_function_game/q&a.dart';

void answercheck(int buttonindex, pageindex) {
  buttonindex == datas['questions'][pageindex]['correctIndex']
      ? match = true
      : match = false;
  print(match);
}
