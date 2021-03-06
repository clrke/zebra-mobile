import 'package:zero_mobile/base/baseModel.dart';

class PollModel extends BaseModel {
  final String surgeon;
  final String messagePost;
  final String anteriorPhoto;
  final String posteriorPhoto;
  final String status;

  PollModel({this.surgeon,
      this.messagePost,
      this.anteriorPhoto,
      this.posteriorPhoto,
      this.status,
      id,
      updatedAt
  }) : super(id: id, updatedAt: updatedAt);

  factory PollModel.fromJson(Map<String, dynamic> json) {
    return PollModel(
      id: json['id'],
      surgeon: json['surgeon'],
      messagePost: json['message_post'],
      anteriorPhoto: json['anterior_photo'],
      posteriorPhoto: json['posterior_photo'],
      updatedAt: json['updated_at'],
      status: json['status']
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
