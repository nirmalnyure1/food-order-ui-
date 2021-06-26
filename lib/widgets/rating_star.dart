import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final int rating;

  RatingStar({this.rating});
  @override
  Widget build(BuildContext context) {
    String star = '';
    // int rate = rating;
    for (int i = 0; i < rating; i++) {
      star += '⭐';
    }
    if (star != null) {
      return Text(
        star,
        style: TextStyle(fontSize: 15.0, letterSpacing: 2.0),
      );
    } else {
      return Text('');
    }
  }
}
