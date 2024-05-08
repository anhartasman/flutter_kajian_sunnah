import 'package:bloc/bloc.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

import './bloc.dart';

class UserLoginBloc extends Bloc<UserLoginBlocEvent, UserLoginBlocState> {
  final UserLoginUseCase userLoginUseCase;

  UserLoginBloc({
    required this.userLoginUseCase,
  }) : super(UserLoginBlocStateOnIdle()) {
    on<UserLoginBlocEvent>((event, emit) async {
      if (event is UserLoginBlocStart) {
        emit(UserLoginBlocStateOnStarted());
        try {
          final failureOrTrivia = await userLoginUseCase(UserLoginUseCaseParam(
            email: event.email,
            password: event.password,
          ));

          final theData = await failureOrTrivia.first;

          emit(UserLoginBlocStateOnSuccess(theData));
        } catch (e) {
          emit(UserLoginBlocStateOnError(
            email: event.email,
            password: event.password,
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
