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
        emit(GetPostContentBlocStateOnStarted(event.searchParam));
        try {
          final failureOrTrivia =
              await getPostContentUseCase(event.searchParam);

          final theData = await failureOrTrivia.first;

          emit(GetPostContentBlocStateOnSuccess(theData, event.searchParam));
        } catch (e) {
          emit(GetPostContentBlocStateOnError(
            errorMessage: e.toString(),
            searchParam: event.searchParam,
          ));
        }
      } else if (event is GetPostContentBlocNextPage) {
        add(GetPostContentBlocStart(state.searchParam.copyWith(
          page: state.searchParam.page + 1,
        )));
      }
    });
  }
}
