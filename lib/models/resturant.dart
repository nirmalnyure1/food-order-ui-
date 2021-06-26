import 'food.dart';

class Restaurant {
  final String name;
  final String address;
  final int rating;
  final String imageUrl;

  final List<Food> menu;

  Restaurant({this.name, this.address, this.rating, this.imageUrl, this.menu});
}
