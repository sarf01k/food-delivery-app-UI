import 'package:flutter/material.dart';
import 'package:delivery_app/models.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  void removeFromCart(FoodPlace food, BuildContext context) {
    final app = context.read<App>();
    app.removeFromCart(food);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<App>(
      builder: (context, value, child) {
        return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w700
        ),
      ),
      body: value.cart.isNotEmpty ? SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                value.cart.length, (index) {
                  final FoodPlace food = value.cart[index];
                  final String foodName = food.name;
                  final double foodPrice = food.pricing;
                  final String foodImg = food.imgPath;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      tileColor: Color(0xFFF7F7F8),
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Image.asset(foodImg)
                      ),
                      title: Text(foodName),
                      subtitle: Text('GHS' + foodPrice.toStringAsFixed(2)),
                      trailing: GestureDetector(
                        onTap: () {
                          removeFromCart(food, context);
                        },
                        child: Image.asset('assets/icons/delete.png', color: Colors.black, width: 20,)
                        ),
                    ),
                  );
                }
              ),
            ),
          )
        )
      ) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/emptycart.png', scale: 6),
            SizedBox(height: 10),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: value.cart.isNotEmpty ? Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFAF6FE2),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(
          'Pay now',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),
      ) : null,
    );
      }
    );
  }
}