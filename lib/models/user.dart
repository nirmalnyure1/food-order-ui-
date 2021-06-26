import 'order.dart';

class User {
  final name;
  final List<Order> cart;
  final List<Order> orders;

  User({this.name, this.cart, this.orders});
}
