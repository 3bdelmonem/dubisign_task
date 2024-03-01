import 'package:dubisign_task/features/home/data/models/user_model.dart';
import 'package:dubisign_task/features/home/domain/entities/users.dart';
class UsersModel extends Users {
  const UsersModel({
    required List<UserModel> users,
    required int total,
    required int skip,
    required int limit,
  }) : super(users: users, total: total, skip: skip, limit: limit);

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    users: List<UserModel>.from(json["users"].map((x) => UserModel.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}