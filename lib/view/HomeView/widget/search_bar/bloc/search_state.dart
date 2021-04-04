part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchListLoading extends SearchState {}

class SearchListDone extends SearchState {
  final List<TokpedProduct> listTokpedProduct;

  SearchListDone({this.listTokpedProduct});

  @override
  List<Object> get props => [listTokpedProduct];
}

class SearchListFailure extends SearchState {
  final String message;

  SearchListFailure({this.message});

  @override
  List<Object> get props => [message];
}

class SearchListSuggestionDone extends SearchState {
  final List<Keyword> suggestion;

  SearchListSuggestionDone({this.suggestion});

  @override
  List<Object> get props => [suggestion];
}
