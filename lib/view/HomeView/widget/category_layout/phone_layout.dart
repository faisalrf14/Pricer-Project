import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';
import 'package:pricer_project/view/Widget/clickable_card.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  var idSelected = 0;

  String _selectedCategory = '';
  String _selectedFilter = 'Lowest Price';
  String _selectedQuery = '';
  String _parentCategory = 'mobilePhone';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(
      GetListCategoryProducts(
        limit: '10',
        query: 'handphone',
        parentCategory: _parentCategory,
        fromLow: _selectedFilter == 'Lowest Price' ? true : false,
      ),
    );
    setState(() {
      _selectedCategory = 'mobile';
      _selectedFilter = 'Lowest Price';
      _selectedQuery = 'handphone';
    });
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: _isSearching ? BackButton() : BackButton(),
        title:
            _isSearching ? _buildSearchField() : Text('Mobile Phone Category'),
        actions: _buildActions(),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Chip(
                            backgroundColor: _selectedCategory == 'iOS'
                                ? Colors.red
                                : Colors.grey[300],
                            label: Text(
                              'iOS',
                              style: TextStyle(
                                  color: _selectedCategory == 'iOS'
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<CategoryBloc>(context).add(
                              GetListCategoryProducts(
                                  limit: '10',
                                  query: 'iphone',
                                  parentCategory: 'mobilePhone'),
                            );
                            setState(() {
                              _selectedCategory = 'iOS';
                              _selectedQuery = 'iphone';
                              _selectedFilter = 'Lowest Price';
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Chip(
                            backgroundColor: _selectedCategory == 'Android'
                                ? Colors.red
                                : Colors.grey[300],
                            label: Text(
                              'Android',
                              style: TextStyle(
                                  color: _selectedCategory == 'Android'
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<CategoryBloc>(context).add(
                                GetListCategoryProducts(
                                    limit: '10',
                                    query: 'android',
                                    parentCategory: 'mobilePhone'));
                            setState(() {
                              _selectedCategory = 'Android';
                              _selectedQuery = 'android';
                              _selectedFilter = 'Lowest Price';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommend for you!',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButton(
                      value: _selectedFilter,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedFilter = newValue;
                        });
                        BlocProvider.of<CategoryBloc>(context).add(
                          GetListCategoryProducts(
                            limit: '10',
                            query: _selectedQuery,
                            parentCategory: _parentCategory,
                            fromLow: _selectedFilter == 'Lowest Price'
                                ? true
                                : false,
                          ),
                        );
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('Lowest Price'),
                          value: 'Lowest Price',
                        ),
                        DropdownMenuItem(
                          child: Text('Highest Price'),
                          value: 'Highest Price',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                if (state is CategoryMobilePhoneSearchDone) {
                  return Flexible(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: state.listProducts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ClickableCard(
                        mainProducts: state.listProducts[index],
                      ),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                    ),
                  );
                }
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Text('Select the sub category first'),
                );
              })
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search ...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
      onSubmitted: (query) {
        setState(() {
          _selectedQuery = query;
          _selectedFilter = 'Lowest Price';
        });
        BlocProvider.of<CategoryBloc>(context).add(
          GetListCategoryProducts(
            limit: '10',
            query: _selectedQuery,
            parentCategory: _parentCategory,
            fromLow: true,
          ),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }
}
