part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchListLoading extends SearchState {}

class SearchListDone extends SearchState {
  final List<MainProducts> listProducts;
  final String query;

  SearchListDone({required this.listProducts, required this.query});

  @override
  List<Object> get props => [listProducts, query];
}

class SearchListFailure extends SearchState {
  final String message;

  SearchListFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class SearchListSuggestionDone extends SearchState {
  final List<Keyword> suggestion;

  SearchListSuggestionDone({required this.suggestion});

  @override
  List<Object> get props => [suggestion];
}
