import 'package:dubisign_task/features/home/domain/entities/users.dart';

class UsersModel extends Users {
  const UsersModel({
    required List<User> users,
    required int total,
    required int skip,
    required int limit,
  }) : super(users: users, total: total, skip: skip, limit: limit);

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