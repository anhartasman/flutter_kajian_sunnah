import 'package:equatable/equatable.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostTopic.dart';

abstract class GetTopicBlocState extends Equatable {
  const GetTopicBlocState();
  @override
  List<Object> get props => [];
}

class GetTopicBlocStateOnIdle extends GetTopicBlocState {
  const GetTopicBlocStateOnIdle();
}

class GetTopicBlocStateOnStarted extends GetTopicBlocState {}

class GetTopicBlocStateOnSuccess extends GetTopicBlocState {
  final List<PostTopic> result;
  const GetTopicBlocStateOnSuccess(this.result);
}

class GetTopicBlocStateOnError extends GetTopicBlocState {
  final String errorMessage;
  GetTopicBlocStateOnError({
    required this.errorMessage,
  });
}
