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
    this.parentCategory,
    this.query,
    this.limit,
    this.fromLow,
  });

  @override
  List<Object> get props => [query, limit];
}
