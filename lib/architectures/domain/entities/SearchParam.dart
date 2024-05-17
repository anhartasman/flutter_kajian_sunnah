import 'dart:convert';

import 'package:flutter/foundation.dart';

class SearchParam {
  final int limit;
  final int page;
  final String sort;
  final Map<String, dynamic> filter;
  const SearchParam({
    this.limit = 5,
    this.page = 1,
    this.sort = '-created_at',
    this.filter = const {},
  });

  SearchParam copyWith({
    int? limit,
    int? page,
    String? sort,
    Map<String, dynamic>? filter,
  }) {
    return SearchParam(
      limit: limit ?? this.limit,
      page: page ?? this.page,
      sort: sort ?? this.sort,
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'page': page,
      'sort': sort,
      'filter': filter,
    };
  }

  factory SearchParam.fromMap(Map<String, dynamic> map) {
    return SearchParam(
      limit: map['limit']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      sort: map['sort'] ?? '',
      filter: Map<String, dynamic>.from(map['filter']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchParam.fromJson(String source) =>
      SearchParam.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchParam(limit: $limit, page: $page, sort: $sort, filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchParam &&
        other.limit == limit &&
        other.page == page &&
        other.sort == sort &&
        mapEquals(other.filter, filter);
  }

  @override
  int get hashCode {
    return limit.hashCode ^ page.hashCode ^ sort.hashCode ^ filter.hashCode;
  }
}
