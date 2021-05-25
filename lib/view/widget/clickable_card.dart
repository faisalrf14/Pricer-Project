import 'package:flutter/material.dart';
import 'package:pricer_project/data/constant.dart';
import 'package:pricer_project/models/main_response/main_products.dart';
import 'package:pricer_project/view/DetailView/detail_view.dart';

class ClickableCard extends StatelessWidget {
  final MainProducts mainProducts;

  ClickableCard({required this.mainProducts});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              mainProducts.imageUrl,
              fit: BoxFit.fitWidth,
            ),
            ListTile(
              title: Text(
                mainProducts.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Row(
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
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(mainProducts: mainProducts),
          ),
        );
      },
    );
  }
}
