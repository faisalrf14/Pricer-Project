import 'package:flutter/material.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/furniture_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/hobby_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/laptop_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/phone_layout.dart';

// API
final baseAPI = "http://10.0.2.2:3000/";

class CategoryItem {
  String title;
  String appBarTitle;
  String name;
  String image;
  Widget onPressed;

  CategoryItem(
      {this.title, this.appBarTitle, this.name, this.image, this.onPressed});
}

List<CategoryItem> categoryList = [
  new CategoryItem(
    title: "Hobby",
    appBarTitle: 'Hobby Category',
    image: "assets/images/hobby.png",
    onPressed: HobbyPage(),
  ),
  new CategoryItem(
    title: "Mobile Phone",
    appBarTitle: 'Mobile Phone Category',
    image: "assets/images/mobile.png",
    onPressed: PhonePage(),
  ),
  new CategoryItem(
    title: "Furniture",
    appBarTitle: 'Furniture Category',
    image: "assets/images/furniture.png",
    onPressed: FurniturePage(),
  ),
  new CategoryItem(
    title: "Laptop",
    appBarTitle: 'Laptop Category',
    image: "assets/images/laptop.png",
    onPressed: LaptopPage(),
  ),
];

// class DetailItem {
//   String title;
//   String image;
//   DetailItem({this.title, this.image});
// }

// List<DetailItem> detailList = [
//       new DetailItem(
//         title: "Hobby",
//         image: "assets/images/gaming.png",
//       ),
//       new DetailItem(
//         title: "Laptop",
//         image: "assets/images/computer.png",
//       ),
//       new DetailItem(
//         title: "Furniture",
//         image: "assets/images/furniture.png",
//       ),
//       new DetailItem(
//         title: "Hobby",
//         image: "assets/images/gaming.png",
//       ),
//       new DetailItem(
//         title: "Laptop",
//         image: "assets/images/computer.png",
//       ),
//       new DetailItem(
//         title: "Furniture",
//         image: "assets/images/furniture.png",
//       ),
//     ];