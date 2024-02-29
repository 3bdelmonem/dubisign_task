part of 'home_cubit.dart';
sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class GetAllUsersLoading extends HomeState {}
final class GetAllUsersPaginationLoading extends HomeState {}
final class GetAllUsersSuccess extends HomeState {}
final class AddFriend extends HomeState {}
final class GetAllUsersError extends HomeState {
  final String message;
  const GetAllUsersError({required this.message});
}