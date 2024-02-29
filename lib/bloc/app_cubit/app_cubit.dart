import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app/app_data.dart';
import '../../core/app/app_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository repository;
  AppCubit({required this.repository}) : super(AppInitial()) {
    _appData = repository.loadAppData();
  }

  AppData? _appData;

  AppStates get appState {
    if (_appData == null || _appData!.isSeenTutorial != true) {
      return AppStates.notSeenTutorial;
    }
    if (_appData!.isSelectLang != true) {
      return AppStates.notselectLang;
    }
    if (_appData!.isGuestUser == null ||
        (_appData!.isGuestUser != null && _appData!.isGuestUser == true)) {
      return AppStates.guest;
    }
    if (_appData!.nafath == false) {
      return AppStates.notVerifyNafath;
    }
    if (_appData!.isVerfied == false) {
      return AppStates.notVerified;
    }
    if (_appData != null &&
        (_appData!.id == null ||
            _appData!.id == "null" ||
            _appData!.id!.isEmpty)) {
      return AppStates.unauthenticated;
    }
    if (_appData!.isCompleted == false) {
      return AppStates.notCompleted;
    }

    return AppStates.authenticated;
  }

  void authenticate(
    AppData data,
  ) async {
    _appData = data.copyWith(
        userId: data.id.toString(),
        name: data.displayName,
        phoneCopy: data.phone,
        emailCopy: data.email,
        tokenCopy: data.token,
        isCompleteed: data.isCompleted,
        isverfied: data.isVerfied,
        seenTutorial: data.isSeenTutorial,
        typeUserCopy: data.typeUser,
        title: data.title,
        notificationStatus: data.notificationStatus,
        langCode: data.languageCode);
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void updateData(
    AppData data,
  ) async {
    _appData = _appData!.copyWith(
      userId: data.id.toString(),
      name: data.displayName,
      typeUserCopy: data.typeUser,
      phoneCopy: data.phone,
      emailCopy: data.email,
      photo: data.photoUrl,
      isCompleteed: data.isCompleted,
      isGuestUserCopy: data.isGuestUser,
      isverfied: data.isVerfied,
      notificationStatus: data.notificationStatus,
      title: data.title,
      langCode: data.languageCode,
      nafathCopy: data.nafath,
    );
    await repository.store.setAppData(_appData!);

    emit(UpdateDataState(appData: _appData!));
    emit(AppInitial());
  }

  void seenIntro() async {
    if (_appData == null) {
      _appData = AppData(
        isSeenTutorial: true,
      );
    } else {
      _appData = _appData!.copyWith(
        seenTutorial: true,
      );
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void selectLanguage() async {
    if (_appData == null) {
      _appData = AppData(
        isSelectLang: true,
      );
    } else {
      _appData = _appData!.copyWith(
        selectLang: true,
      );
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void verfied() async {
    if (_appData == null) {
      _appData =
          AppData(isSeenTutorial: true, isGuestUser: false, isVerfied: true);
    } else {
      _appData = _appData!.copyWith(
          seenTutorial: true, isGuestUserCopy: false, isverfied: true);
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void verifyNafath({required String nationalId}) async {
    if (_appData == null) {
      _appData = AppData(nafath: true, nationalId: nationalId);
    } else {
      _appData =
          _appData!.copyWith(nafathCopy: true, nationalIdCopy: nationalId);
    }
    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }

  void unAuthenticate() async {
    _appData = _appData!.copyWith(
      seenTutorial: true,
      isGuestUserCopy: false,
      isverfied: false,
      nafathCopy: false,
      nationalIdCopy: '',
      tokenCopy: "",
      userId: "",
      phoneCopy: "",
      name: "",
      photo: "",
      typeUserCopy: "",
      notificationStatus: "",
      title: '',
    );

    await repository.store.setAppData(_appData!);
    emit(UpdateDataState(appData: _appData!));
  }
}
