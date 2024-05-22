import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/bloc/get_post_content/bloc.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/PostItem.dart';
import 'package:kajiansunnah/widgets/reusables/ReusableWidget.dart';
import 'package:shimmer/shimmer.dart';

class search_screen extends StatelessWidget {
  final PostCategory? postCategory;
  final String? keyword;
  const search_screen({
    super.key,
    this.postCategory,
    this.keyword,
  });

  @override
  Widget build(BuildContext context) {
    // var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: ReusableWidget.pageBar(
        context,
        title: postCategory == null ? "Hasil Pencarian" : postCategory!.name,
      ),
      body: SafeArea(
        child: BlocProvider<GetPostContentBloc>(
          create: (BuildContext context) => di.sl<GetPostContentBloc>()
            ..add(GetPostContentBlocStart(SearchParam(
              limit: 100,
              filter: {
                "category_id": postCategory == null ? null : postCategory!.id,
                "search": keyword,
              },
            ))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16.0,
                  left: 8,
                  right: 8,
                ),
                child: _search_field(
                    categoryId: postCategory == null
                        ? null
                        : postCategory!.id.toString()),
              ),
              Expanded(
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
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: idxr == 0 ? 8.0 : 0),
                                          child: PostItem(
                                            state.result[idxc + idxr],
                                            gridItem: true,
                                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _search_field extends StatelessWidget {
  final String? categoryId;
  const _search_field({
    super.key,
    this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: OpenSansRegular11,
      onSubmitted: (str) => BlocProvider.of<GetPostContentBloc>(context)
          .add(GetPostContentBlocStart(SearchParam(
        limit: 100,
        filter: {
          "category_id": categoryId,
          "search": str,
        },
      ))),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 28,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: OpenSansRegular14.copyWith(
          color: Colors.grey,
        ),
        hintText: "apa yang ingin kamu cari?",
        fillColor: Colors.white,
        isDense: true,
      ),
    );
  }
}
