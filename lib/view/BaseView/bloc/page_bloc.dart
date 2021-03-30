import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is SelectedPage) {
      yield* _mapSelectedPageToState(event);
    }
  }

  Stream<PageState> _mapSelectedPageToState(SelectedPage event) async* {
    if (event.pageState == 'Login') {
      yield PageLogin();
    } else if (event.pageState == 'Register') {
      yield PageRegis();
    } else {
      yield PageLoading();
    }
  }
}
