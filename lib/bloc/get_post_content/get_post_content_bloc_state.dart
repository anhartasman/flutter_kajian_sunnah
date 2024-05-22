import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';

abstract class GetPostContentBlocState extends Equatable {
  final SearchParam searchParam;
  const GetPostContentBlocState({this.searchParam = const SearchParam()});
  @override
  List<Object> get props => [];
}

class GetPostContentBlocStateOnIdle extends GetPostContentBlocState {
  const GetPostContentBlocStateOnIdle();
}

class GetPostContentBlocStateOnStarted extends GetPostContentBlocState {
  final SearchParam searchParam;
  const GetPostContentBlocStateOnStarted(this.searchParam)
      : super(searchParam: searchParam);
}

class GetPostContentBlocStateOnSuccess extends GetPostContentBlocState {
  final List<PostContent> result;
  final SearchParam searchParam;
  const GetPostContentBlocStateOnSuccess(this.result, this.searchParam)
      : super(searchParam: searchParam);
}

class GetPostContentBlocStateOnError extends GetPostContentBlocState {
  final String errorMessage;
  final SearchParam searchParam;
  GetPostContentBlocStateOnError({
    required this.errorMessage,
    required this.searchParam,
  }) : super(searchParam: searchParam);
}
