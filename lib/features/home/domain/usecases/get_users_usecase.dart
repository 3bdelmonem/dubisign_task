import 'package:dartz/dartz.dart';
import 'package:dubisign_task/core/error/failures.dart';
import 'package:dubisign_task/core/usecases/use_case.dart';
import 'package:dubisign_task/features/home/data/models/users_model.dart';
import 'package:dubisign_task/features/home/domain/repositories/home_repository.dart';

class GetUsersUseCase extends UseCase<UsersModel, PaginationParams> {
  final HomeRepository homeRepository;
  GetUsersUseCase({required this.homeRepository,});

  @override
  Future<Either<Failure, UsersModel>> call(PaginationParams params) async {
    return await homeRepository.getAllUsers(parms: params);
  }
}
class PaginationParams {
  final int skip;
  final int limit;
  PaginationParams({required this.limit, required this.skip});
}
