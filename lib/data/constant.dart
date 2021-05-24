import 'package:flutter/material.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/furniture_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/hobby_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/laptop_layout.dart';
import 'package:pricer_project/view/HomeView/widget/category_layout/phone_layout.dart';

// API
final baseAPI = "http://192.168.18.46:3000/";

final kConstantLimit = '20';

class CategoryItem {
  String title;
  String parentCategory;
  String appBarTitle;
  String name;
  String image;
  Widget content;

  CategoryItem({
    this.title,
    this.parentCategory,
    this.appBarTitle,
    this.name,
    this.image,
    this.content,
  });
}

List<CategoryItem> categoryList = [
  new CategoryItem(
    title: "Hobby",
    parentCategory: 'hobby',
    appBarTitle: 'Hobby Category',
    image: "assets/images/hobby.png",
    content: HobbyPage(),
  ),
  new CategoryItem(
    title: "Mobile Phone",
    parentCategory: 'mobilePhone',
    appBarTitle: 'Mobile Phone Category',
    image: "assets/images/mobile.png",
    content: PhonePage(),
  ),
  new CategoryItem(
    title: "Furniture",
    parentCategory: 'furniture',
    appBarTitle: 'Furniture Category',
    image: "assets/images/furniture.png",
    content: FurniturePage(),
  ),
  new CategoryItem(
    title: "Laptop",
    parentCategory: 'laptop',
    appBarTitle: 'Laptop Category',
    image: "assets/images/laptop.png",
    content: LaptopPage(),
  ),
];

final imageNotFound =
    "https://cdn.icon-icons.com/icons2/1674/PNG/512/close_111152.png";
final imageTokpedLogo = "assets/images/tokpedimg.png";
final imageShopeeLogo = "assets/images/shopeeimg.jpeg";

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
