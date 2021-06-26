import 'package:food_orderapp_ui_design/models/food.dart';
import 'package:food_orderapp_ui_design/models/resturant.dart';

class Order {
  final String date;
  final Restaurant restaurant;
  final Food food;
  final int quantity;

  Order({this.date, this.restaurant, this.food, this.quantity});
}
