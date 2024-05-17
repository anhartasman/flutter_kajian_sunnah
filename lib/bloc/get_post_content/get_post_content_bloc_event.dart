import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';

abstract class GetPostContentBlocEvent {}

class GetPostContentBlocStart extends GetPostContentBlocEvent {
  final SearchParam searchParam;
  GetPostContentBlocStart(this.searchParam);
}
