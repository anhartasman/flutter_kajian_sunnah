import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';

abstract class GetUstadzProfileBlocEvent {}

class GetUstadzProfileBlocStart extends GetUstadzProfileBlocEvent {
  final SearchParam searchParam;
  GetUstadzProfileBlocStart(this.searchParam);
}
