import 'package:delivery_app/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});
  final FoodPlace food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final List<FoodPlace> cart =[];
  int foodQuantity = 1;
  @override
  Widget build(BuildContext context) {
  final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.food.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500
          )
        ),
        actions: [
          Image.asset('assets/icons/options.png')
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screen.height * .45,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.food.imgPath), fit: BoxFit.cover),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.food.name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700
                    )
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Authentic tase, perfected recipe;\nPerfection',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F8),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Additional Options',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          )
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            'Choose',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Spacer(),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Color(0xFFF7F7F8)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F8),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (foodQuantity > 1) {
                                foodQuantity--;
                              }
                            });
                          }
                        ),
                        Container(
                          width: 30,
                          child: Center(
                            child: Text(
                              foodQuantity.toString(),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          )
                        ),
                        IconButton(icon: Icon(Icons.add),
                        onPressed: () {
                            setState(() {
                              foodQuantity++;
                            });
                          }
                        )
                      ],
                    )
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (foodQuantity > 0) {
                          final app = context.read<App>();
                          app.addToCart(widget.food, foodQuantity);
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                            return AlertDialog(
                              content: Text('Successfuly added to cart!'),
                              actions: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  icon: Text('OK')
                                )
                              ],
                            );
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFAF6FE2),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            SizedBox(width: 30),
                            Text(
                              'GHS ' + (widget.food.pricing*foodQuantity).toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              )
                            )
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}