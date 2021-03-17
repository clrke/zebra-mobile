import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:zero_mobile/models/pollModel.dart';

class PollProvider extends ChangeNotifier{
  List<String> checkList = [];
  File anteriorPhoto;
  File posteriorPhoto;
  String currentPhotoSelected;
  String anteriorPhotoUploadType;
  String posteriorPhotoUploadType;
  PollModel currentPoll;
  Map<String,dynamic> pollCase;

  setPollCase(Map<String,dynamic> caseData) {
    pollCase = caseData;
    notifyListeners();
  }

  setCurrentPoll({@required PollModel poll}){
    currentPoll = poll;
    notifyListeners();
  }

  anteriorUploadType({@required String uploadType}){
    anteriorPhotoUploadType = uploadType;
    notifyListeners();
  }

  posteriorUploadType({@required String uploadType}){
    posteriorPhotoUploadType = uploadType;
    notifyListeners();
  }

  setPhotoSelected({@required String photo}){
    currentPhotoSelected = photo;
    notifyListeners();
  }

  anteriorAddPhoto({@required File imageFile}){
    anteriorPhoto = imageFile;
    notifyListeners();
  }

  posteriorAddPhoto({@required File imageFile}){
    posteriorPhoto = imageFile;
    notifyListeners();
  }

  anteriorRemovePhoto(){
    anteriorPhoto = null;
    notifyListeners();
  }

  posteriorRemovePhoto(){
    posteriorPhoto = null;
    notifyListeners();
  }

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

  resetFields(){
    anteriorPhoto = null;
    posteriorPhoto = null;
    currentPhotoSelected = null;
    anteriorPhotoUploadType = null;
    posteriorPhotoUploadType = null;
    notifyListeners();
  }
}