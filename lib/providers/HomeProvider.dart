import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/utils/localStorage.dart';
import 'package:zero_mobile/utils/utils.dart';

class HomeProvider extends ChangeNotifier{
  List<Map<String, dynamic>> routeList = Utils.bottomNavigationRoutes();
  String accessToken;
  String appBarTitle = 'OnGoing Operations';
  int currentIndex = 0;

  setCurrentIndex({@required int index}){
    currentIndex = index;
    appBarTitle = routeList[index]['title'];
    notifyListeners();
  }

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