import 'package:bloc/bloc.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetTopicUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

import './bloc.dart';

class GetTopicBloc extends Bloc<GetTopicBlocEvent, GetTopicBlocState> {
  final GetTopicUseCase getTopicUseCase;

  GetTopicBloc({
    required this.getTopicUseCase,
  }) : super(GetTopicBlocStateOnIdle()) {
    on<GetTopicBlocEvent>((event, emit) async {
      if (event is GetTopicBlocStart) {
        emit(GetTopicBlocStateOnStarted());
        try {
          final failureOrTrivia = await getTopicUseCase(NoParams());

          final theData = await failureOrTrivia.first;

          emit(GetTopicBlocStateOnSuccess(theData));
        } catch (e) {
          emit(GetTopicBlocStateOnError(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
