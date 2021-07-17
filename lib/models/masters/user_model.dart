import 'package:bs_admin/helpers/helpers.dart';

class UserModel {

  int id;
  String? fullname;
  String? username;
  String? userpassword;
  String? token;

  UserModel({
    this.id = 0,
    this.fullname,
    this.username,
    this.userpassword,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: parseInt(map['id']),
      fullname: parseString(map['fullname']),
      username: parseString(map['username']),
      userpassword: parseString(map['userpassword']),
      token: parseString(map['token']),
    );
  }
}