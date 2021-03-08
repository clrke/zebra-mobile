import 'package:zero_mobile/base/baseModel.dart';

class PollModel extends BaseModel {
  final String surgeon;
  final String messagePost;
  final String anteriorPhoto;
  final String posteriorPhoto;
  final String updatedAt;

  PollModel(
      {this.updatedAt,
      this.surgeon,
      this.messagePost,
      this.anteriorPhoto,
      this.posteriorPhoto})
      : super();

  factory PollModel.fromJson(Map<String, dynamic> json) {
    return PollModel(
      surgeon: json['surgeon'],
      messagePost: json['message_post'],
      anteriorPhoto: json['anterior_photo'],
      posteriorPhoto: json['posterior_photo'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        'surgeon': surgeon,
        'messagePost': messagePost,
        'anteriorPhoto': anteriorPhoto,
        'posteriorPhoto': posteriorPhoto,
        'updatedAt': updatedAt
      };
}
