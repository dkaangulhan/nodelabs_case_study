import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// Pagination
@freezed
abstract class Pagination with _$Pagination {
  /// Pagination
  const factory Pagination({
    required int totalCount,
    required int perPage,
    required int maxPage,
    required int currentPage,
  }) = _Pagination;

  /// Creates [Pagination] from json
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
