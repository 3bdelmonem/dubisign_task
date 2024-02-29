import 'dart:convert';

UsersModel usersModelFromJson(String str) => UsersModel.fromJson(json.decode(str));
class UsersModel {
  final List<User> users;
  final int total;
  final int skip;
  final int limit;

  UsersModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String email;
  final String phone;
  final String username;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.email,
    required this.phone,
    required this.username,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    maidenName: json["maidenName"],
    age: json["age"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    image: json["image"],
  );
}
