part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
  
  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {}

class PageLoading extends PageState {}

class PageLogin extends PageState {}

class PageRegis extends PageState {}

class PageHome extends PageState {}

class PageItems extends PageState {}
