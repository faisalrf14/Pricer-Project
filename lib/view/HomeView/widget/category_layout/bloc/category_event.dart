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

  GetListCategoryProducts({this.parentCategory, this.query, this.limit});

  @override
  List<Object> get props => [query, limit];
}
