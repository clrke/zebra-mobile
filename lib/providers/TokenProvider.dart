import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/utils/localStorage.dart';

class TokenProvider extends ChangeNotifier{
  String accessToken;

  storeToken() async{
    accessToken = await LocalStorage.readLocalStorage('_token');
    notifyListeners();
  }

  deleteToken() async{
    accessToken = null;
    LocalStorage.deleteLocalStorage('_token');
    notifyListeners();
  }
}