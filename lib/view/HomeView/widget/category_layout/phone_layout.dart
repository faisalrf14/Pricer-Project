import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/view/DetailView/detail_view.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';
import 'package:pricer_project/view/Widget/clickable_card.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'handphone', parentCategory: 'mobilePhone'));
    setState(() {
      _selectedCategory = 'mobile';
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
                          backgroundColor: _selectedCategory == 'iOS' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'iOS',
                            style: TextStyle(color: _selectedCategory == 'iOS' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'iphone', parentCategory: 'mobilePhone'));
                          setState(() {
                            _selectedCategory = 'iOS';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Android' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Android',
                            style: TextStyle(color: _selectedCategory == 'Android' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'android', parentCategory: 'mobilePhone'));
                          setState(() {
                            _selectedCategory = 'Android';
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
              if (state is CategoryMobilePhoneSearchDone) {
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
