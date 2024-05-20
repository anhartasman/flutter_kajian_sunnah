import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/bloc/get_post_content/bloc.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/HomeContent.dart';
import 'package:kajiansunnah/widgets/HomeHeader.dart';
import 'package:kajiansunnah/widgets/HomeTopic.dart';
import 'package:kajiansunnah/widgets/HomeUstadz.dart';
import 'package:kajiansunnah/widgets/PageBar.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/widgets/PostItem.dart';
import 'package:shimmer/shimmer.dart';

class search_screen extends StatelessWidget {
  final PostCategory postCategory;
  const search_screen({
    super.key,
    required this.postCategory,
  });

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageBar(postCategory.name),
            Expanded(
              child: BlocProvider<GetPostContentBloc>(
                create: (BuildContext context) => di.sl<GetPostContentBloc>()
                  ..add(GetPostContentBlocStart(SearchParam(filter: {
                    "category_id": postCategory.id,
                  }))),
                child: BlocConsumer<GetPostContentBloc,
                        GetPostContentBlocState>(
                    listener: (context, state) {},
                    builder: (BuildContext context, state) {
                      if (state is GetPostContentBlocStateOnStarted) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              enabled: true,
                              child: GridView.count(
                                physics: new NeverScrollableScrollPhysics(),
                                childAspectRatio: 1.1,
                                shrinkWrap: true,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                crossAxisCount: 2,
                                children: List.generate(9, (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[100]!,
                                            width: 0.5),
                                        color: Colors.white),
                                    padding: EdgeInsets.all(8),
                                    width: 20,
                                    height: 20,
                                  );
                                }),
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is GetPostContentBlocStateOnSuccess) {
                        final jumBaris = (state.result.length / 2).ceil();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListView.builder(
                            itemBuilder: (_, baris) {
                              final idxc = baris * 2;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(2, (idxr) {
                                    try {
                                      return Expanded(
                                        child: PostItem(
                                          state.result[idxc + idxr],
                                          gridItem: true,
                                        ),
                                      );
                                    } catch (e) {
                                      return Expanded(child: Container());
                                    }
                                  }),
                                ),
                              );
                            },
                            itemCount: jumBaris,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
