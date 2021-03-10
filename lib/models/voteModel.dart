import 'package:zero_mobile/base/baseModel.dart';

class Votes {
  final String surgeon;
  final int id;
  final String pollVote;
  final remarks;


  Votes({this.surgeon,this.id,this.pollVote,this.remarks});

  factory Votes.fromJson(Map<String, dynamic> json) {
    return Votes(
      id: json['id'],
      surgeon: json['surgeon'],
      pollVote: json['poll_vote'],
      remarks: json['remarks'],
    );
  }
}

class VoteModel extends BaseModel {
  final String surgeon;
  final String anteriorPhoto;
  final String posteriorPhoto;
  final String yesRatioVote;
  final String noRatioVote;
  final List<Votes> votes;

  VoteModel({this.surgeon,
    this.anteriorPhoto,
    this.posteriorPhoto,
    this.yesRatioVote,
    this.noRatioVote,
    this.votes,
    id,
    updatedAt
  }) : super(id: id, updatedAt: updatedAt);

  factory VoteModel.fromJson(Map<String, dynamic> json) {
    final List votes = json['vote_set'];
    return VoteModel(
      id: json['id'],
      surgeon: json['surgeon'],
      anteriorPhoto: json['anterior_photo'],
      posteriorPhoto: json['posterior_photo'],
      yesRatioVote:json['get_yes_ratio'],
      noRatioVote:json['get_no_ratio'],
      votes:votes.map((vote) => Votes.fromJson(vote)).toList(),
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'surgeon': surgeon,
    'anteriorPhoto': anteriorPhoto,
    'posteriorPhoto': posteriorPhoto,
    'updatedAt': updatedAt
  };
}
