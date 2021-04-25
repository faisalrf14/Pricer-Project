import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pricer_project/data/repositories/search_repositories.dart';
import 'package:pricer_project/models/main_response/main_products.dart';
import 'package:pricer_project/models/main_response/main_response.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final SearchRepositories searchRepositories;

  CategoryBloc({this.searchRepositories}) : super(CategoryInitial());

  Future<List<MainProducts>> getProductList({String query, String limit}) async {
    List<MainProducts> _listProduct;
    try {
      MainResponse mainResponse = await searchRepositories.getMainProducts(query: query, limit: limit);
      _listProduct = mainResponse.data.products;
    } catch (e) {
      print(e);
      _listProduct = [];
    }
    return _listProduct;
  }

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is GetListCategoryProducts) {
      yield* _mapGetListCategoryProductsToState(event);
    }
  }

  Stream<CategoryState> _mapGetListCategoryProductsToState(GetListCategoryProducts event) async* {
    yield CategoryLoading();

    List<MainProducts> _searchResult = await getProductList(query: event.query, limit: event.limit);
    if (_searchResult.length == 0) {
      yield CategoryInitial();
    } else {
      if (event.parentCategory == 'hobby') {
        yield CategoryHobbySearchDone(listProducts: _searchResult);
      } else if (event.parentCategory == 'mobilePhone') {
        yield CategoryMobilePhoneSearchDone(listProducts: _searchResult);
      } else if (event.parentCategory == 'furniture') {
        yield CategoryFurnitureSearchDone(listProducts: _searchResult);
      } else if (event.parentCategory == 'laptop') {
        yield CategoryLaptopSearchDone(listProducts: _searchResult);
      } else {
        yield CategoryParentSearchDone(listProducts: _searchResult);
      }
    }
  }
}
