import 'package:bloc/bloc.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetUstadzProfileUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

import './bloc.dart';

class GetUstadzProfileBloc
    extends Bloc<GetUstadzProfileBlocEvent, GetUstadzProfileBlocState> {
  final GetUstadzProfileUseCase getUstadzProfileUseCase;

  GetUstadzProfileBloc({
    required this.getUstadzProfileUseCase,
  }) : super(GetUstadzProfileBlocStateOnIdle()) {
    on<GetUstadzProfileBlocEvent>((event, emit) async {
      if (event is GetUstadzProfileBlocStart) {
        emit(GetUstadzProfileBlocStateOnStarted());
        try {
          final failureOrTrivia =
              await getUstadzProfileUseCase(event.searchParam);

          final theData = await failureOrTrivia.first;

          emit(GetUstadzProfileBlocStateOnSuccess(theData));
        } catch (e) {
          emit(GetUstadzProfileBlocStateOnError(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
