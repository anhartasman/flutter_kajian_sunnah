import 'package:bloc/bloc.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetPostContentUseCase.dart';
import 'package:kajiansunnah/architectures/usecase/usecase.dart';

import './bloc.dart';

class GetPostContentBloc
    extends Bloc<GetPostContentBlocEvent, GetPostContentBlocState> {
  final GetPostContentUseCase getPostContentUseCase;

  GetPostContentBloc({
    required this.getPostContentUseCase,
  }) : super(GetPostContentBlocStateOnIdle()) {
    on<GetPostContentBlocEvent>((event, emit) async {
      if (event is GetPostContentBlocStart) {
        emit(GetPostContentBlocStateOnStarted());
        try {
          final failureOrTrivia =
              await getPostContentUseCase(event.searchParam);

          final theData = await failureOrTrivia.first;

          emit(GetPostContentBlocStateOnSuccess(theData));
        } catch (e) {
          emit(GetPostContentBlocStateOnError(
            errorMessage: e.toString(),
          ));
        }
      }
    });
  }
}
