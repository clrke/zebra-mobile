import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/models/voteModel.dart';

class VoteProvider extends ChangeNotifier{
  int selectedPollId;
  List<Votes> votes = [];

  setVotes({@required vote}) {
    votes = vote;
    notifyListeners();
  }

  setPollId({@required int id}){
    selectedPollId = id;
    notifyListeners();
  }

  resetFields(){
    selectedPollId = null;
    votes = [];
    notifyListeners();
  }
}