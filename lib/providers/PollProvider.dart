import 'package:flutter/cupertino.dart';

class PollProvider extends ChangeNotifier{
  List<String> checkList = [];

  addChecklist({@required List<String> checklist})async{
    checkList = checklist;
    notifyListeners();
  }

  removeChecklist({@required checklist})async{
    checkList.remove(checklist);
    notifyListeners();
  }

  clearChecklist(){
    checkList.clear();
    notifyListeners();
  }
}