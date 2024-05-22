import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostContent.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/bloc/get_post_content/bloc.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/ListShimmer.dart';
import 'package:kajiansunnah/widgets/PostItem.dart';
import 'package:kajiansunnah/widgets/reusables/ReusableWidget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
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
              limit: 6,
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
                child: _search_result(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _search_result extends StatefulWidget {
  const _search_result({
    super.key,
  });

  @override
  State<_search_result> createState() => __search_resultState();
}

class __search_resultState extends State<_search_result> {
  List<PostContent> feedList = [];
  bool isLastPage = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final jumBaris = (feedList.length / 2).ceil();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            final Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return BlocConsumer<GetPostContentBloc, GetPostContentBlocState>(
              listener: (context, state) {
                if (state is GetPostContentBlocStateOnSuccess) {
                  if (mounted) {
                    if (state.searchParam.page == 1) {
                      isLastPage = false;
                      feedList.clear();
                    }
                    if (state.result.isEmpty) {
                      isLastPage = true;
                    }
                    setState(() {
                      feedList.addAll(state.result);
                    });
                  }
                  _refreshController.loadComplete();
                }
              },
              builder: (BuildContext context, state) {
                if (state is GetPostContentBlocStateOnStarted) {
                  return Center(
                    child: SpinKitWave(
                      color: Warna.warnaUtama,
                      size: 50.0,
                    ),
                  );
                }

                return Container(
                  height: 55.0,
                );
              },
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: () {
          if (!isLastPage) {
            BlocProvider.of<GetPostContentBloc>(context)
                .add(GetPostContentBlocNextPage());
          } else {
            Future.delayed(Duration(seconds: 1))
                .then((value) => _refreshController.loadComplete());
          }
        },
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
                        padding: EdgeInsets.only(right: idxr == 0 ? 8.0 : 0),
                        child: PostItem(
                          feedList[idxc + idxr],
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
        limit: 6,
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
