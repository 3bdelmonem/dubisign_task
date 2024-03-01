import 'package:dartz/dartz.dart';
import 'package:dubisign_task/core/error/exceptions.dart';
import 'package:dubisign_task/core/error/failures.dart';
import 'package:dubisign_task/features/home/data/datasources/home_datasource.dart';
import 'package:dubisign_task/features/home/domain/entities/users.dart';
import 'package:dubisign_task/features/home/domain/repositories/home_repository.dart';
import 'package:dubisign_task/features/home/domain/usecases/get_users_usecase.dart';


class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImp({required this.homeDataSource});
  
  @override
  Future<Either<Failure, Users>> getAllUsers({required PaginationParams parms}) async {
    try {
      final users = await homeDataSource.getAllUsers(parms: parms);
      return Right(users);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
