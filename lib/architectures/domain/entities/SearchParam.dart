import 'dart:convert';

class SearchParam {
  final int limit;
  final int page;
  final String sort;
  const SearchParam({
    this.limit = 5,
    this.page = 1,
    this.sort = '-created_at',
  });

  SearchParam copyWith({
    int? limit,
    int? page,
    String? sort,
  }) {
    return SearchParam(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      sort: sort ?? this.sort,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'page': page,
      'sort': sort,
    };
  }

  factory SearchParam.fromMap(Map<String, dynamic> map) {
    return SearchParam(
      limit: map['limit']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      sort: map['sort'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchParam.fromJson(String source) =>
      SearchParam.fromMap(json.decode(source));

  @override
  String toString() => 'SearchParam(limit: $limit, page: $page, sort: $sort)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchParam &&
        other.limit == limit &&
        other.page == page &&
        other.sort == sort;
  }

  @override
  int get hashCode => limit.hashCode ^ page.hashCode ^ sort.hashCode;
}
