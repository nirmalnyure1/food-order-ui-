import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orderapp_ui_design/data.dart/data.dart';
import 'package:food_orderapp_ui_design/models/resturant.dart';
import 'package:food_orderapp_ui_design/screen/cart_screen.dart';
import 'package:food_orderapp_ui_design/screen/restaurant_screen.dart';
import 'package:food_orderapp_ui_design/widgets/rating_star.dart';
import 'package:food_orderapp_ui_design/widgets/recentorder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _buildRestaurant() {
    List<Widget> restaurantList = [];
    for (Restaurant restaurant in restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaurantScreen(
                          restaurant: restaurant,
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.0, color: Colors.grey.shade100),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Hero(
                    tag: restaurant.name,
                    child: Image(
                      image: AssetImage(restaurant.imageUrl),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      restaurant.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      restaurant.address,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                    RatingStar(rating: restaurant.rating),
                    SizedBox(height: 2.0),
                    Text(
                      'star: ${restaurant.rating.toString()}',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.0),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Food App',
          style: TextStyle(
              fontWeight: FontWeight.w900, letterSpacing: 3, wordSpacing: 3),
        ),
        centerTitle: true,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20.0),
          icon: Icon(
            Icons.home,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              child: Text(
                'Cart(${currentUser.cart.length})',
                style: TextStyle(color: Colors.white60, fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'search for the food or resturant',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.green, size: 20.0),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            RecentOrder(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Text('Nearby Restaurants',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600))),
                _buildRestaurant(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
