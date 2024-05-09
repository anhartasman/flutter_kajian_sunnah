import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserLogoutUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';
import './bloc.dart';

class HomeNavBloc extends Bloc<HomeNavBlocEvent, HomeNavBlocState> {
  final UserLogoutUseCase userLogoutUseCase;
  HomeNavBloc({
    required this.userLogoutUseCase,
  }) : super(HomeNavBlocState()) {
    on<HomeNavBlocEvent>((event, emit) async {
      if (event is HomeNavBlocChange) {
        emit(state.copyWith(menuActive: event.menuNumber));
      } else if (event is HomeNavOpenDrawer) {
        debugPrint("buka drawer");
        emit(state.copyWith(
          openDrawer: true,
        ));
        Future.delayed(Duration(milliseconds: 500))
            .then((value) => add(HomeNavCloseDrawer()));
      } else if (event is HomeNavCloseDrawer) {
        debugPrint("tutup drawer");
        emit(state.copyWith(
          openDrawer: false,
        ));
      } else if (event is HomeNavLogout) {
        debugPrint("logout akun");
        try {
          final failureOrTrivia = await userLogoutUseCase(NoParams());

          await failureOrTrivia.first;
        } catch (e) {}
        emit(state.copyWith(
          logout: true,
        ));
      }
    });
  }
}
