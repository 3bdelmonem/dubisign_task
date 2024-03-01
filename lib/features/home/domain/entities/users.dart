import 'package:dubisign_task/features/home/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final List<User> users;
  final int total;
  final int skip;
  final int limit;

  const Users({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [users, total, skip, limit]; 
}