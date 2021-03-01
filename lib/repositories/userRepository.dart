import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:zero_mobile/constants/settings.dart';
import 'package:zero_mobile/models/tokenModel.dart';

class UserRepository {
  String username;
  String password;

  UserRepository({this.username,this.password});

  static Future<TokenModel> login({@required String username,@required String password}) async {
    String url = '${settings['serverUrl']}o/token/';
    Map<String,dynamic> data = {
      'username': username,
      'password': password,
      'grant_type': 'password',
      'client_id': settings['client_id'],
      'client_secret': settings['client_secret']
    };

    final userDetails = await http.post(url,body: data);
    Map<String,dynamic> responseJson = jsonDecode(userDetails.body);
    return TokenModel.fromJson(TokenModel(accessToken:responseJson['access_token'],refreshToken:responseJson['refresh_token']).toJson());
  }
}