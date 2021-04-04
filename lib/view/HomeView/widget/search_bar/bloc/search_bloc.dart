import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pricer_project/data/repositories/tokped_repositories.dart';
import 'package:pricer_project/models/tokped/keyword.dart';
import 'package:pricer_project/models/tokped/tokped_product.dart';
import 'package:pricer_project/models/tokped/tokped_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TokpedRepositories tokpedRepositories;

  SearchBloc({this.tokpedRepositories}) : super(SearchInitial());

  Future<List<Keyword>> getSuggestion({String query, String limit}) async {
    List<Keyword> _suggestions;
    try {
      TokpedResponse tokpedResponse =
          await tokpedRepositories.getTokpedProduct(query: query, limit: limit);
      _suggestions = tokpedResponse.data.related.otherRelated;
    } catch (e) {
      print(e);
      _suggestions = [];
    }
    return _suggestions;
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

  Stream<SearchState> _mapGetTokpedSuggestionToState(
      GetTokpedSuggestion event) async* {
    yield SearchListLoading();

    List<Keyword> _suggestions =
        await getSuggestion(query: event.query, limit: event.limit);
    yield SearchListSuggestionDone(suggestion: _suggestions);
  }

  Stream<SearchState> _mapGetTokpedProductToState(GetTokpedProduct event) async* {
    // List<TokpedProduct> _searchResult = await 
  }
}
