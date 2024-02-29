import 'package:dio/dio.dart';
import 'package:dubisign_task/core/error/exceptions.dart';
import 'package:dubisign_task/core/util/api_basehelper.dart';
import 'package:dubisign_task/features/home/data/models/users_model.dart';
import 'package:dubisign_task/features/home/domain/usecases/get_users_usecase.dart';

abstract class HomeDataSource {
  Future<UsersModel> getAllUsers({required PaginationParams parms});
}
class HomeDataSourceImp extends HomeDataSource {
  final ApiBaseHelper apiBaseHelper;
  HomeDataSourceImp({required this.apiBaseHelper});
  @override
  Future<UsersModel> getAllUsers({required PaginationParams parms}) async {
    try {
      final Response response = await apiBaseHelper.get(
        url: "?limit=${parms.limit}&skip=${parms.skip}",
      );
      UsersModel usersModel = UsersModel.fromJson(response.data);
      return usersModel;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
