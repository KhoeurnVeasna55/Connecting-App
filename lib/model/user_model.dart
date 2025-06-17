import 'dart:convert';

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

class UserModel {
  String? id;
  String? username;
  String? updatedAt;
  String? phonenumber;
  dynamic age;
  dynamic address;
  String? profileImage;

  UserModel({
    this.id,
    this.username,
    this.updatedAt,
    this.phonenumber,
    this.age,
    this.address,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    username: json["username"],
    updatedAt: json["updated_at"],
    phonenumber: json["phonenumber"],
    age: json["age"],
    address: json["address"],
    profileImage: json["profile_image"],
  );
}
