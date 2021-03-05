import 'package:flutter/cupertino.dart';

class PollProvider extends ChangeNotifier{
  List<String> checkList = [];

  addChecklist({@required checklist})async{
    checkList.add(checklist);
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