import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajiansunnah/architectures/domain/entities/PostCategory.dart';
import 'package:kajiansunnah/architectures/domain/entities/SearchParam.dart';
import 'package:kajiansunnah/bloc/get_post_content/bloc.dart';
import 'package:kajiansunnah/bloc/get_ustadz/bloc.dart';
import 'package:kajiansunnah/injection_container.dart' as di;
import 'package:kajiansunnah/theme/colors/Warna.dart';
import 'package:kajiansunnah/theme/styles/text/opensans_style_text.dart';
import 'package:kajiansunnah/widgets/PostItem.dart';
import 'package:kajiansunnah/widgets/UstadzItem.dart';
import 'package:kajiansunnah/widgets/UstadzItem.dart';
import 'package:shimmer/shimmer.dart';

class HomeContent extends StatelessWidget {
  final PostCategory postCategory;
  const HomeContent(this.postCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            bottom: 16,
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 2.0, color: Colors.lightBlue.shade600),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    postCategory.name,
                    style: OpenSansSemiBold18,
                  ),
                ),
                Text(
                  "Lihat semua >",
                  style: OpenSansSemiBold12.copyWith(
                    color: Warna.warnaUtama,
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocProvider<GetPostContentBloc>(
          create: (BuildContext context) => di.sl<GetPostContentBloc>()
            ..add(GetPostContentBlocStart(SearchParam(filter: {
              "category_id": postCategory.id,
            }))),
          child: BlocConsumer<GetPostContentBloc, GetPostContentBlocState>(
              listener: (context, state) {},
              builder: (BuildContext context, state) {
                if (state is GetPostContentBlocStateOnStarted) {
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
                if (state is GetPostContentBlocStateOnSuccess) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          state.result.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PostItem(
                                  state.result[index],
                                ),
                              )),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }
}
