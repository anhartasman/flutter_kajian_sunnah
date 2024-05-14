import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/bloc/get_topic/bloc.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/widgets/TopicItem.dart';
import 'package:shimmer/shimmer.dart';

class HomeTopic extends StatelessWidget {
  const HomeTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTopicBloc>(
      create: (BuildContext context) =>
          di.sl<GetTopicBloc>()..add(GetTopicBlocStart()),
      child: BlocConsumer<GetTopicBloc, GetTopicBlocState>(
          listener: (context, state) {},
          builder: (BuildContext context, state) {
            if (state is GetTopicBlocStateOnStarted) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      10,
                      (index) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: 100,
                                height: 20,
                                color: Colors.black,
                              ),
                            ),
                          )),
                ),
              );
            }
            if (state is GetTopicBlocStateOnSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      state.result.length,
                      (index) => TopicItem(
                            state.result[index].name,
                          )),
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
