import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/bloc/category_bloc.dart';

class HobbyPage extends StatefulWidget {
  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> {
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'hobby', parentCategory: 'hobby'));
    setState(() {
      _selectedCategory = 'hobby';
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
                          backgroundColor: _selectedCategory == 'Gaming' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Gaming',
                            style: TextStyle(color: _selectedCategory == 'Gaming' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'gaming', parentCategory: 'hobby'));
                          setState(() {
                            _selectedCategory = 'Gaming';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Photography' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Photography',
                            style: TextStyle(color: _selectedCategory == 'Photography' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'photography', parentCategory: 'hobby'));
                          setState(() {
                            _selectedCategory = 'Photography';
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Chip(
                          backgroundColor: _selectedCategory == 'Sport' ? Colors.red : Colors.grey[300],
                          label: Text(
                            'Sport',
                            style: TextStyle(color: _selectedCategory == 'Sport' ? Colors.white : Colors.black),
                          ),
                        ),
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(GetListCategoryProducts(limit: '10', query: 'sport', parentCategory: 'hobby'));
                          setState(() {
                            _selectedCategory = 'Sport';
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
              if (state is CategoryHobbySearchDone) {
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


//  CarouselSlider(
//             height: 180.0,
//             enlargeCenterPage: true,
//             autoPlay: true,
//             aspectRatio: 16 / 9,
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enableInfiniteScroll: true,
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             viewportFraction: 0.8,
//             items: [
//               Card(
//                 child: Container(
//                   margin: EdgeInsets.all(5.0),
//                   width: 500,
//                   height: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/hobby/game.png'),
//                       fit: BoxFit.cover,
//                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Gaming',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 child: Container(
//                   margin: EdgeInsets.all(5.0),
//                   width: 500,
//                   height: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/hobby/foto.jpg'),
//                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Photography',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 child: Container(
//                   margin: EdgeInsets.all(5.0),
//                   width: 500,
//                   height: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/hobby/sport.jpg'),
//                       colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Sport',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),