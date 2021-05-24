import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';
import 'package:pricer_project/view/Widget/clickable_card.dart';

class LaptopPage extends StatefulWidget {
  @override
  _LaptopPageState createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";
  var idSelected = 0;

  String _selectedCategory = '';
  String _selectedFilter = 'Lowest Price';
  String _selectedQuery = '';
  String _parentCategory = 'laptop';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(
      GetListCategoryProducts(
        limit: kConstantLimit,
        query: _parentCategory,
        parentCategory: _parentCategory,
        fromLow: _selectedFilter == 'Lowest Price' ? true : false,
      ),
    );
    setState(() {
      _selectedCategory = _parentCategory;
      _selectedFilter = 'Lowest Price';
      _selectedQuery = _parentCategory;
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
          title: _isSearching ? _buildSearchField() : Text('Laptop Category'),
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
                              backgroundColor:
                                  _selectedCategory == 'Laptop Gaming'
                                      ? Colors.red
                                      : Colors.grey[300],
                              label: Text(
                                'Laptop Gaming',
                                style: TextStyle(
                                    color: _selectedCategory == 'Laptop Gaming'
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<CategoryBloc>(context).add(
                                GetListCategoryProducts(
                                    limit: kConstantLimit,
                                    query: 'laptop gaming',
                                    parentCategory: _parentCategory),
                              );
                              setState(() {
                                _selectedCategory = 'Laptop Gaming';
                                _selectedQuery = 'laptop gaming';
                                _selectedFilter = 'Lowest Price';
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Chip(
                              backgroundColor:
                                  _selectedCategory == 'Office Laptop'
                                      ? Colors.red
                                      : Colors.grey[300],
                              label: Text(
                                'Office Laptop',
                                style: TextStyle(
                                    color: _selectedCategory == 'Office Laptop'
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<CategoryBloc>(context).add(
                                GetListCategoryProducts(
                                    limit: kConstantLimit,
                                    query: 'office laptop',
                                    parentCategory: _parentCategory),
                              );
                              setState(() {
                                _selectedCategory = 'Office Laptop';
                                _selectedQuery = 'office laptop';
                                _selectedFilter = 'Lowest Price';
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Chip(
                              backgroundColor:
                                  _selectedCategory == 'Content Creator Laptop'
                                      ? Colors.red
                                      : Colors.grey[300],
                              label: Text(
                                'Content Creator Laptop',
                                style: TextStyle(
                                    color: _selectedCategory ==
                                            'Content Creator Laptop'
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<CategoryBloc>(context).add(
                                GetListCategoryProducts(
                                    limit: kConstantLimit,
                                    query: 'laptop content creator',
                                    parentCategory: _parentCategory),
                              );
                              setState(() {
                                _selectedCategory = 'Content Creator Laptop';
                                _selectedQuery = 'laptop content creator';
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
                              limit: kConstantLimit,
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
                  if (state is CategoryLaptopSearchDone) {
                    return Flexible(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: state.listProducts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ClickableCard(
                          mainProducts: state.listProducts[index],
                        ),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(1),
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
        ));
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
            limit: kConstantLimit,
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
