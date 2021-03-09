import 'package:flutter/cupertino.dart';

class VoteProvider extends ChangeNotifier{
  int selectedPollId;

  setPollId({@required int id}){
    selectedPollId = id;
    notifyListeners();
  }

  resetFields(){
    selectedPollId = null;
    notifyListeners();
  }
}