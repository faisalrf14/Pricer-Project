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

  CategoryParentSearchDone({required this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryHobbySearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryHobbySearchDone({required this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryMobilePhoneSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryMobilePhoneSearchDone({required this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryFurnitureSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryFurnitureSearchDone({required this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategoryLaptopSearchDone extends CategoryState {
  final List<MainProducts> listProducts;

  CategoryLaptopSearchDone({required this.listProducts});

  @override
  List<Object> get props => [listProducts];
}

class CategorySearchFailure extends CategoryState {}
