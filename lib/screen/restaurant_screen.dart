import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orderapp_ui_design/models/food.dart';
import 'package:food_orderapp_ui_design/models/resturant.dart';
import 'package:food_orderapp_ui_design/widgets/rating_star.dart';

class RestaurantScreen extends StatelessWidget {
  Widget _body(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: restaurant.name,
              child: Image(
                image: AssetImage(restaurant.imageUrl),
                height: heightSize / 4,
                width: widthSize,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    radius: 18,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150.0,
              bottom: 5.0,
              right: 30.0,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.red,
                child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {}),
              ),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        wordSpacing: 1.0),
                  ),
                  Text(
                    '24 km aways',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              SizedBox(height: 10),
              RatingStar(
                rating: restaurant.rating,
              ),
              SizedBox(height: 10),
              Text(
                restaurant.address,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    onPressed: () {},
                    child: Text(
                      ' Reviews ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                    onPressed: () {},
                    child: Text(
                      ' Contact ',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        expaded(),
      ],
    );
  }

  Expanded expaded() {
    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        children: List.generate(restaurant.menu.length, (index) {
          Food food = restaurant.menu[index];
          return _buildMenuItem(food);
        }),
      ),
    );
  }

  final Restaurant restaurant;
  RestaurantScreen({this.restaurant});
  _buildMenuItem(Food menus) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage(menus.imageUrl),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black38),
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            top: 60.0,
            bottom: 40.0,
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    menus.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 23),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$${menus.price.toString()}',
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            left: 100.0,
            top: 90.0,
            bottom: 10.0,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Scaffold(body: _body(context));
  }
}
