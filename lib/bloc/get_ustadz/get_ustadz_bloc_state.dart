import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/UstadzProfile.dart';

abstract class GetUstadzProfileBlocState extends Equatable {
  const GetUstadzProfileBlocState();
  @override
  List<Object> get props => [];
}

class GetUstadzProfileBlocStateOnIdle extends GetUstadzProfileBlocState {
  const GetUstadzProfileBlocStateOnIdle();
}

class GetUstadzProfileBlocStateOnStarted extends GetUstadzProfileBlocState {}

class GetUstadzProfileBlocStateOnSuccess extends GetUstadzProfileBlocState {
  final List<UstadzProfile> result;
  const GetUstadzProfileBlocStateOnSuccess(this.result);
}

class GetUstadzProfileBlocStateOnError extends GetUstadzProfileBlocState {
  final String errorMessage;
  GetUstadzProfileBlocStateOnError({
    required this.errorMessage,
  });
}
