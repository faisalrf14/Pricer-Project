import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricer_project/logic/auth/auth_bloc.dart';
import 'package:pricer_project/view/HomeView/grid_dashboard.dart';
import 'package:pricer_project/view/HomeView/widget/search_bar/bloc/search_bloc.dart';

import 'widget/search_bar/search_bar.dart';

class MyHome extends StatefulWidget {
  final String email;

  MyHome({this.email});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String email;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getCurrentUser() {
    setState(() {
      this.email = widget.email.split("@").first;
    });
  }

  _handleLogout() {
    BlocProvider.of<AuthBloc>(context).add(UserLoggedOut());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Welcome! " + this.email ?? "",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () => _handleLogout(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  olShopCompare(
                    imageSrc: "assets/images/tokpedimg.png",
                    title: "Tokopedia",
                  ),
                  olShopCompare(
                    imageSrc: "assets/images/shopeeimg.jpeg",
                    title: "Shopee",
                  ),
                ],
              ),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                if (state is SearchListDone) {
                  return Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: state.listTokpedProduct.map((e) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        e.imageUrl,
                                        width: 100,
                                        height: 100,
                                      ),
                                      ListTile(
                                        title: Text(e.name),
                                        subtitle: Text(
                                          e.price,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Image.network(
                                        e.imageUrl,
                                        width: 100,
                                        height: 100,
                                      ),
                                      ListTile(
                                        title: Text(e.name),
                                        subtitle: Text(
                                          e.price,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                if (state is SearchListLoading) {
                  return CircularProgressIndicator();
                }
                return Dashboard();
              }),
            ],
          ),
        ),
        SearchBar(),
      ],
    );
  }

  Widget olShopCompare({String imageSrc, String title}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            imageSrc,
            width: 100,
          ),
        ),
      ),
    );
  }
}
