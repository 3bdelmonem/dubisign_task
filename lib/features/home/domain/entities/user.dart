import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String image;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.image,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, username, image]; 
}