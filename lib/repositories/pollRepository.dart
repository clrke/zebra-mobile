import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:zero_mobile/models/pollModel.dart';
import 'package:zero_mobile/models/voteModel.dart';
import '../utils/apiInstance.dart';

class PollRepository {
  static String url = 'current-poll/';
  static Dio api = ApiInstance.apiInstance();

  static Future<PollModel> fetchCurrentPoll() async {
    final url = 'current-poll';
    var responsePolls = await ApiInstance.apiInstance().get(url);
    return PollModel.fromJson(responsePolls.data);
  }

  static Future<VoteModel> fetchVotes() async {
    final url = 'current-poll';
    var responsePolls = await ApiInstance.apiInstance().get(url);
    return VoteModel.fromJson(responsePolls.data);
  }

  static Future<PollModel> fetchPollsById({@required int id}) async {
    final url = 'polls/$id';
    var responsePolls = await ApiInstance.apiInstance().get(url);
    return PollModel.fromJson(responsePolls.data);
  }

  static Future<List<PollModel>> fetchPolls() async {
    final url = 'polls';
    Response responsePolls = await ApiInstance.apiInstance().get(url);

    if(responsePolls.statusCode == 200) {
      List responseJson = responsePolls.data['results'];
      var polls = responseJson.map((poll) => PollModel.fromJson(poll)).toList();
      return polls;
    } else if (responsePolls.statusCode == 401) {
      fetchPolls();
    } else {
      return [];
    }
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
    try {
      String fileName = photos.path.split('/').last;
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
    } catch(error){
      print(error);
    }
  }
}
