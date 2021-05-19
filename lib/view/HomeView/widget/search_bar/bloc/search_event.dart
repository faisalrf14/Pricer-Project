part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetTokpedSuggestion extends SearchEvent {
  final String query;
  final String limit;

  GetTokpedSuggestion({this.query, this.limit});

  @override
  List<Object> get props => [query, limit];
}

class GetTokpedProduct extends SearchEvent {
  final String parentCategory;
  final String query;
  final String limit;
  final bool fromLow;

  GetTokpedProduct({this.query, this.limit, this.fromLow, this.parentCategory});

  @override
  List<Object> get props => [query, limit];
}
