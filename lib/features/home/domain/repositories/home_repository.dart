import 'package:dartz/dartz.dart';
import 'package:dubisign_task/core/error/failures.dart';
import 'package:dubisign_task/features/home/domain/entities/users.dart';
import 'package:dubisign_task/features/home/domain/usecases/get_users_usecase.dart';
abstract class HomeRepository {
  Future<Either<Failure, Users>> getAllUsers({required PaginationParams parms});
}
