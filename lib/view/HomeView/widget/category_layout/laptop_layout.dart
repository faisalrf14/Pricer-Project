import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';

class LaptopPage extends StatefulWidget {
  @override
  _LaptopPageState createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'laptop', parentCategory: 'laptop'));
    setState(() {
      _selectedCategory = 'laptop';
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
                          backgroundColor: _selectedCategory == 'Laptop Gaming' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Laptop Gaming',
                            style: TextStyle(color: _selectedCategory == 'Laptop Gaming' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'laptop gaming', parentCategory: 'laptop'));
                          setState(() {
                            _selectedCategory = 'Laptop Gaming';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Office Laptop' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Office Laptop',
                            style: TextStyle(color: _selectedCategory == 'Office Laptop' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'office laptop', parentCategory: 'laptop'));
                          setState(() {
                            _selectedCategory = 'Office Laptop';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Content Creator Laptop' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Content Creator Laptop',
                            style: TextStyle(color: _selectedCategory == 'Content Creator Laptop' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'laptop content creator', parentCategory: 'laptop'));
                          setState(() {
                            _selectedCategory = 'Content Creator Laptop';
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
              if (state is CategoryLaptopSearchDone) {
                return Flexible(
                  child: GridView.count(
                    childAspectRatio: 1.0,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: state.listProducts.map((e) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Image.network(
                              e.imageUrl ?? imageNotFound,
                              width: 100,
                              height: 100,
                            ),
                            ListTile(
                                title: Text(
                                  e.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14),
                                ),
                                subtitle: Row(
                                  children: [
                                    Image.asset(
                                      e.originOlShop == "tokopedia" ? imageTokpedLogo : imageShopeeLogo,
                                      width: 30,
                                    ),
                                    Text(
                                      e.price,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      );
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
