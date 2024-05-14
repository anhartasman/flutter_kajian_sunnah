import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/bloc/get_ustadz/bloc.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/widgets/UstadzItem.dart';
import 'package:kajiansunnah/widgets/UstadzItem.dart';
import 'package:shimmer/shimmer.dart';

class HomeUstadz extends StatelessWidget {
  const HomeUstadz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetUstadzProfileBloc>(
      create: (BuildContext context) =>
          di.sl<GetUstadzProfileBloc>()..add(GetUstadzProfileBlocStart()),
      child: BlocConsumer<GetUstadzProfileBloc, GetUstadzProfileBlocState>(
          listener: (context, state) {},
          builder: (BuildContext context, state) {
            if (state is GetUstadzProfileBlocStateOnStarted) {
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
            if (state is GetUstadzProfileBlocStateOnSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      state.result.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UstadzItem(
                              state.result[index],
                            ),
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
