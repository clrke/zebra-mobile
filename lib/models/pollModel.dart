import 'package:zero_mobile/base/baseModel.dart';

class PollModel extends BaseModel {
  final String surgeon;
  final String messagePost;
  final String anteriorPhoto;
  final String posteriorPhoto;

  PollModel(
      {this.surgeon, this.messagePost, this.anteriorPhoto, this.posteriorPhoto})
      : super();

  factory PollModel.fromJson(Map<String, dynamic> json) {
    return PollModel(
      surgeon: json['surgeon'],
      messagePost: json['messagePost'],
      anteriorPhoto: json['anteriorPhoto'],
      posteriorPhoto: json['posteriorPhoto'],
    );
  }

  Map<String, dynamic> toJson() => {
        'surgeon': surgeon,
        'messagePost': messagePost,
        'anteriorPhoto': anteriorPhoto,
        'posteriorPhoto': posteriorPhoto,
      };
}
