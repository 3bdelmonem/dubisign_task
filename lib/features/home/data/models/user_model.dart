import 'package:dubisign_task/features/home/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String image,

  }) : super(id: id, firstName: firstName, lastName: lastName, email: email, username: username, image: image);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    username: json["username"],
    image: json["image"],
  );
}