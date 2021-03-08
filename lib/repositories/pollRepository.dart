import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/models/pollModel.dart';
import '../utils/apiInstance.dart';

class PollRepository {
  static String url = 'current-poll/';
  static Dio api = ApiInstance.apiInstance();

  static Future<List<PollModel>> fetchPolls() async {
    final url = 'polls';
    var responsePolls = await ApiInstance.apiInstance().get(url);
    List responseJson = responsePolls.data['results'];
    var polls = responseJson.map((poll) => PollModel.fromJson(poll)).toList();
    return polls;
  }

  static Future createPoll() async {
    var responsePoll = await api.get(
      url,
      options: Options(headers: {
        HttpHeaders.acceptHeader: "application/json",
      }),
    );
    return responsePoll;
  }

  static Future savePoll({@required String caption}) async {
    Map<String, dynamic> data = {"message_post": caption, "status": "P"};
    return await api.patch(url, data: FormData.fromMap(data));
  }

  static Future savePhoto({@required File photos,@required String type}) async {
    String fileName = photos.path.split('/').last;
    print(fileName);
    var responsePoll;

    if (type == 'anterior_photo') {
      responsePoll = await api.patch(url,
          data: FormData.fromMap({
            "anterior_photo":
            await MultipartFile.fromFile(photos.path, filename: fileName)
          }));
    }

    if (type == 'posterior_photo') {
      responsePoll = await api.patch(url,
          data: FormData.fromMap({
            "posterior_photo":
            await MultipartFile.fromFile(photos.path, filename: fileName)
          }));
    }

    return responsePoll;
  }
}
