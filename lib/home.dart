import 'package:delivery_app/food_page.dart';
import 'package:delivery_app/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
  final app = context.read<App>();
  final popularFoods = app.popularFoods;
  final discountFoods = app.discountFoods;
  final foodPlaces = app.foodPlaces;
  final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: Color(0xFFF7F7F8),
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/icons/user.png', height: 25, color: Colors.black),
                    Row(
                      children: [
                        Image.asset('assets/icons/location-filled.png', color: Color(0xFFF38140), height: 20),
                        SizedBox(width: 5),
                        Text(
                          '12 Oak Street',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          )
                        ),
                        SizedBox(width: 5),
                        Image.asset('assets/icons/arrow-down.png', height: 15),
                      ],
                    ),
                    Image.asset('assets/icons/notification.png', height: 25, color: Colors.black)
                  ],
                ),
              )
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: screen.height * .25,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  cursorColor: Color(0xFFAF6FE2),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: const Color(0xFFF7F7F8),
                                    prefixIcon: Image.asset('assets/icons/search.png', scale: 1.0),
                                    hintText: 'Search',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Image.asset('assets/icons/filter.png', color: Color(0xFFAF6FE2), )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              width: screen.width,
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: const Color(0xFFAF6FE2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: -120,
                                    child: Image.asset(
                                      'assets/images/pizza_banner.png',
                                      height: 300,
                                    )
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Free shipping\non first 3 orders!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: screen.height * .25,
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'See all',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Color(0xFFF7F7F8),
                                      child: Icon(Icons.arrow_forward_ios, size: 10, color: Colors.black,)
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(popularFoods.length, (index) {
                                final food = popularFoods[index];
                                return Container(
                                  margin: index != popularFoods.length - 1 ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF7F7F8),
                                          borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Image.asset(food.imgPath, height: 30)
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        food.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600
                                        )
                                      )
                                    ],
                                  )
                                );
                              })
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: screen.height * .4,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Up to 50% off',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'See all',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Color(0xFFF7F7F8),
                                      child: Icon(Icons.arrow_forward_ios, size: 10, color: Colors.black,)
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(discountFoods.length, (index) {
                                final discountFood = discountFoods[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: discountFood)));
                                  },
                                  child: Container(
                                    margin: index != discountFoods.length - 1 ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: screen.height * .18,
                                          width: screen.width * .8,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFAF6FE2),
                                            image: DecorationImage(image: AssetImage(discountFood.imgPath), fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset('assets/icons/tag.png', height: 20),
                                                      SizedBox(width: 10),
                                                      const Text(
                                                        '50% off',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              discountFood.name,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star_rounded, color: Colors.orange),
                                                const SizedBox(width: 5),
                                                Text(
                                                  discountFoods[index].rating.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                ...discountFood.tags.map((tag) => Text(tag + ' - ', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500))).toList(),
                                                Text(
                                                  'GHS' + discountFoods[index].pricing.toStringAsFixed(2),
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ),
                                );
                              })
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Restaurants & Stores',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          const SizedBox(height: 15),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: List.generate(foodPlaces.length, (index) {
                                final foodPlace = foodPlaces[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: foodPlace,)));
                                  },
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: screen.height * .25,
                                          width: screen.width,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFAF6FE2),
                                            image: DecorationImage(image: AssetImage(foodPlace.imgPath), fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              foodPlace.name,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star_rounded, color: Color(0xFFF38140)),
                                                const SizedBox(width: 5),
                                                Text(
                                                  foodPlaces[index].rating.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                ...foodPlace.tags.map((tag) => Text(tag + ' - ', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500))).toList(),
                                                Text(
                                                  'GHS' + foodPlaces[index].pricing.toStringAsFixed(2),
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}