import 'package:bloc/bloc.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserRegisterUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

import './bloc.dart';

class UserRegisterBloc
    extends Bloc<UserRegisterBlocEvent, UserRegisterBlocState> {
  final UserRegisterUseCase userRegisterUseCase;

  UserRegisterBloc({
    required this.userRegisterUseCase,
  }) : super(UserRegisterBlocStateOnIdle()) {
    on<UserRegisterBlocEvent>((event, emit) async {
      if (event is UserRegisterBlocStart) {
        emit(UserRegisterBlocStateOnStarted());
        try {
          final failureOrTrivia =
              await userRegisterUseCase(event.userRegistration);

          final theData = await failureOrTrivia.first;

          emit(UserRegisterBlocStateOnSuccess());
        } catch (e) {
          emit(UserRegisterBlocStateOnError(
            userRegistration: event.userRegistration,
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
