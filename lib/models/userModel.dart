import 'package:zero_mobile/base/baseModel.dart';

class UserModel extends BaseModel{
  final String firstName;
  final String middleName;
  final String lastName;

  UserModel({
    this.firstName,
    this.lastName,
    this.middleName
  }):super();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      middleName: json['middleName'],
    );
  }

  Map<String, dynamic> toJson() => {
    'firstName' : firstName,
    'lastName' : lastName,
    'middleName' : middleName,
  };
}