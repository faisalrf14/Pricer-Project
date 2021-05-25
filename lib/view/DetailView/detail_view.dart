import 'package:flutter/material.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/models/main_response/main_products.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  final MainProducts mainProducts;

  DetailView({required this.mainProducts});

  void _launchUrl() async {
    if (mainProducts.originOlShop == 'tokopedia') {
      await canLaunch(mainProducts.url)
          ? await launch(mainProducts.url)
          : print('could not launch this url');
    } else {
      String nameMasked =
          mainProducts.name.replaceAll(RegExp('/\s+|[,\/]/g'), '-');
      String urlShopee = 'https://shopee.co.id/' +
          nameMasked +
          '-i.' +
          mainProducts.shopId.toString() +
          '.' +
          mainProducts.itemId.toString();
      await canLaunch(urlShopee)
          ? await launch(urlShopee)
          : print('could not launch this url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.red,
                expandedHeight: 250.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    mainProducts.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ];
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  mainProducts.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          mainProducts.originOlShop == "tokopedia"
                              ? imageTokpedLogo
                              : imageShopeeLogo,
                          width: 30,
                        ),
                        Text(
                          mainProducts.price,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: mainProducts.originOlShop == 'tokopedia'
                              ? Colors.green
                              : Colors.orange,
                        ),
                        onPressed: _launchUrl,
                        child: Text('Go to shop'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  mainProducts.originOlShop == 'tokopedia'
                      ? mainProducts.shop.city
                      : mainProducts.shopLocation,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
