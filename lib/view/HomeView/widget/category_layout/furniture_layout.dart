import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';
import 'package:pricer_project/view/Widget/clickable_card.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'furniture', parentCategory: 'furniture'));
    setState(() {
      _selectedCategory = 'furniture';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                          backgroundColor: _selectedCategory == 'Bedroom' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Bedroom',
                            style: TextStyle(color: _selectedCategory == 'Bedroom' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'bedroom', parentCategory: 'furniture'));
                          setState(() {
                            _selectedCategory = 'Bedroom';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Living Room' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Living Room',
                            style: TextStyle(color: _selectedCategory == 'Living Room' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'living room', parentCategory: 'furniture'));
                          setState(() {
                            _selectedCategory = 'Living Room';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Kitchen' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Kitchen',
                            style: TextStyle(color: _selectedCategory == 'Kitchen' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'kitchen', parentCategory: 'furniture'));
                          setState(() {
                            _selectedCategory = 'Kitchen';
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
              child: Text(
                'Recommend for you!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryFurnitureSearchDone) {
                return Flexible(
                  child: GridView.count(
                    childAspectRatio: 1.0,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: state.listProducts.map((e) {
                      return ClickableCard(mainProducts: e);
                    }).toList(),
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
    );
  }
}
