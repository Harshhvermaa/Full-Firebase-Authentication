import 'package:flutter/cupertino.dart';

class Pages{
  String image;
  String text;

  Pages({required this.image,required this.text});
}

List<Pages> pages = [
  Pages(image: "assets/shop1.jpg", text: "We  provide high\nquality products just\nfor you"),
  Pages(image: "assets/shop2.jpg", text: "Your satisfaction is\nour number one\npriority"),
  Pages(image: "assets/shop3.jpg", text: "Let's fulfill your daily\nneeds with Evira\nright now!")
];