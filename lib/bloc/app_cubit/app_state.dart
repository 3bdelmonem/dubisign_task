part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

class UpdateDataState extends AppState {
  final AppData appData;

  const UpdateDataState({required this.appData});
}
