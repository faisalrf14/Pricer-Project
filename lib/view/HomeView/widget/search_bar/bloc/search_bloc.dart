import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pricer_project/data/repositories/search_repositories.dart';
import 'package:pricer_project/models/main_response/keyword.dart';
import 'package:pricer_project/models/main_response/main_products.dart';
import 'package:pricer_project/models/main_response/main_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepositories searchRepositories;

  SearchBloc({this.searchRepositories}) : super(SearchInitial());

  Future<List<Keyword>> getSuggestion({String query, String limit}) async {
    List<Keyword> _suggestions;
    try {
      MainResponse mainResponse = await searchRepositories.getMainProducts(query: query, limit: limit);
      _suggestions = mainResponse.data.related.otherRelated;
    } catch (e) {
      print(e);
      _suggestions = [];
    }
    return _suggestions;
  }

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
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is GetTokpedSuggestion) {
      yield* _mapGetTokpedSuggestionToState(event);
    }
    if (event is GetTokpedProduct) {
      yield* _mapGetTokpedProductToState(event);
    }
  }

  Stream<SearchState> _mapGetTokpedSuggestionToState(GetTokpedSuggestion event) async* {
    yield SearchListLoading();

    List<Keyword> _suggestions = await getSuggestion(query: event.query, limit: event.limit);
    yield SearchListSuggestionDone(suggestion: _suggestions);
  }

  Stream<SearchState> _mapGetTokpedProductToState(GetTokpedProduct event) async* {
    yield SearchListLoading();

    List<MainProducts> _searchResult = await getProductList(query: event.query, limit: event.limit);
    if (_searchResult.length == 0) {
      yield SearchInitial();
    } else {
      yield SearchListDone(listProducts: _searchResult);
    }
  }
}
