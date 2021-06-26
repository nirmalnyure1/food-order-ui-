import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orderapp_ui_design/data.dart/data.dart';
import 'package:food_orderapp_ui_design/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);
    // Order order;
    // for (int i = 0; i < currentUser.cart.length; i++) {
    //   totalPrice = order.food.price * order.quantity;
    // }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Cart${currentUser.cart.length}'),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: currentUser.cart.length + 1,
        separatorBuilder: (context, int index) {
          return Divider(
            height: 10.0,
            // thickness: 2,
            color: Colors.grey,
          );
        },
        itemBuilder: (context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return listOfCartItem(order);
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1 hour',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Totol Cost:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 80.0),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
          child: Text(
            'CHECKOUT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Container listOfCartItem(Order order) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      margin: EdgeInsets.all(10.0),
      height: 110.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                  image: AssetImage(order.food.imageUrl),
                  width: 120.0,
                  height: 150.0,
                  fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    order.food.name + '',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0),
                  Text(order.restaurant.name + '',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10.0),
                  Container(
                    width: 120,
                    height: 30,
                    //height: 30,
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border:
                          Border.all(width: 2.0, color: Colors.grey.shade200),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                          ),
                          iconSize: 15,
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              var quantity = order.quantity;
                              quantity = quantity--;
                              print('remove');
                            });
                          },
                        ),
                        Text(
                          order.quantity.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 15,
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              var quantity = order.quantity;
                              quantity = quantity++;
                              print('add');
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            // flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                '\$${order.food.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
