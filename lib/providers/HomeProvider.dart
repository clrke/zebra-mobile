import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/utils/localStorage.dart';

class HomeProvider extends ChangeNotifier{
  String accessToken;
  String appBarTitle = 'On Going Operation';

  changeTitle({@required String title}){
    appBarTitle = title;
    notifyListeners();
  }

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