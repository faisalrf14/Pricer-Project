part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryParentSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryParentSearchDone({this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryHobbySearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryHobbySearchDone({this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryMobilePhoneSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryMobilePhoneSearchDone({this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryFurnitureSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryFurnitureSearchDone({this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryLaptopSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryLaptopSearchDone({this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategorySearchFailure extends CategoryState {}
