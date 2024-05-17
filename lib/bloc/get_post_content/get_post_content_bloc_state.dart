import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';

abstract class GetPostContentBlocState extends Equatable {
  const GetPostContentBlocState();
  @override
  List<Object> get props => [];
}

class GetPostContentBlocStateOnIdle extends GetPostContentBlocState {
  const GetPostContentBlocStateOnIdle();
}

class GetPostContentBlocStateOnStarted extends GetPostContentBlocState {}

class GetPostContentBlocStateOnSuccess extends GetPostContentBlocState {
  final List<PostContent> result;
  const GetPostContentBlocStateOnSuccess(this.result);
}

class GetPostContentBlocStateOnError extends GetPostContentBlocState {
  final String errorMessage;
  GetPostContentBlocStateOnError({
    required this.errorMessage,
  });
}
