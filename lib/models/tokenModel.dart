import 'package:zero_mobile/Base/baseModel.dart';

class TokenModel extends BaseModel{
  final String accessToken;
  final String refreshToken;

  TokenModel({this.accessToken,this.refreshToken}):super();

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() => {
    'accessToken' : accessToken,
    'refreshToken' : refreshToken,
  };
}