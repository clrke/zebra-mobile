import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../utils/apiInstance.dart';
import 'package:zero_mobile/utils/localStorage.dart';

class VoteRepository {
  static Dio api = ApiInstance.apiInstance();

  static Future surgeonVote({@required int id, @required String vote, @required String remark}) async {
    final url = 'poll-votes/';
    final surgeonId = await LocalStorage.readLocalStorage('_surgeonId');

    final data = {
      "surgeon": surgeonId,
      "poll": id,
      "poll_vote": vote,
      "remarks": remark
    };

    var responsePolls = await ApiInstance.apiInstance()
        .post(
          url,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode(data)
        ).catchError((error) {
          print(error);
        });

    return responsePolls;
  }
}
