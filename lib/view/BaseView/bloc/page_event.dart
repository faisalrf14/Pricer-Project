part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class SelectedPage extends PageEvent {
  final String pageState;

  SelectedPage({this.pageState});

  @override
  List<Object> get props => [pageState];
}