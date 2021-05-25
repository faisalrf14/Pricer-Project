part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetListCategoryProducts extends CategoryEvent {
  final String parentCategory;
  final String query;
  final String limit;
  final bool fromLow;

  GetListCategoryProducts({
    required this.parentCategory,
    required this.query,
    required this.limit,
    required this.fromLow,
  });

  @override
  List<Object> get props => [query, limit];
}
