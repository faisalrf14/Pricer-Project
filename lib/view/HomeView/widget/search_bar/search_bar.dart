import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/models/main_response/keyword.dart';
import 'package:pricer_project/view/HomeView/widget/search_bar/bloc/search_bloc.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<Keyword> _suggestions;
  String _query;

  @override
  void initState() {
    super.initState();
    setState(() {
      _query = '';
      _suggestions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return BlocListener<SearchBloc, SearchState>(
      listener: (_, state) {
        if (state is SearchListSuggestionDone) {
          setState(() {
            _suggestions = state.suggestion;
          });
        }
      },
      child: FloatingSearchBar(
        clearQueryOnClose: false,
        hint: _query == '' ? 'Search...' : _query,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 500,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) async {
          setState(() {
            _query = query;
          });
          BlocProvider.of<SearchBloc>(context)
              .add(GetTokpedSuggestion(query: _query, limit: kConstantLimit));

          BlocProvider.of<SearchBloc>(context)
              .add(GetTokpedProduct(query: _query, limit: kConstantLimit));
        },
        transition: SlideFadeFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _suggestions.map((e) {
                  return InkWell(
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.search,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.keyword),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _query = e.keyword;
                      });
                      BlocProvider.of<SearchBloc>(context).add(GetTokpedProduct(
                          query: _query, limit: kConstantLimit));
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
