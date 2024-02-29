import 'package:bloc/bloc.dart';
import 'package:dubisign_task/core/error/failures.dart';
import 'package:dubisign_task/features/home/data/models/users_model.dart';
import 'package:dubisign_task/features/home/domain/usecases/get_users_usecase.dart';
import 'package:equatable/equatable.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getUsersUseCase}) : super(HomeInitial());
  final GetUsersUseCase getUsersUseCase;
  List<User> friends = [];
  bool isMore = true;
  int skip = 0;
  List<User> users = [];
  
  Future<void> fGetAllUsers({bool? isFirst,}) async {
    isMore = isFirst ?? isMore;
    if (isFirst ?? false) skip += 10;
    if (isMore) {
      if (skip == 10) {
        emit(GetAllUsersLoading());
        users = [];
      }
      else {
        emit(GetAllUsersPaginationLoading());
      }
      final failOrResponse = await getUsersUseCase(PaginationParams(limit: 10, skip: (isFirst ?? false) ? 0 : skip));
      failOrResponse.fold(
        (left) {
          if (left is ServerFailure) emit(GetAllUsersError(message: left.message));
        },
        (right) {
          right.skip + 10 == right.total ? isMore = false : skip += 10;
          users += right.users;
          emit(GetAllUsersSuccess());
        },
      );
    }
  }

  addOrRemoveFriend(User user) {
    if (friends.contains(user)) {
      friends.remove(user);
    }
    else {
      friends.add(user);
    }
    emit(AddFriend());
    emit(GetAllUsersSuccess());
  }
}
