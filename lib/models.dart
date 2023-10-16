import 'package:flutter/material.dart';

class PopularFood {
  String imgPath;
  String name;

  PopularFood({
    required this.imgPath,
    required this.name
  });
}

class FoodPlace {
  String name;
  String imgPath;
  List<String> tags;
  double rating;
  double pricing;

  FoodPlace({
    required this.imgPath,
    required this.name,
    required this.tags,
    required this.rating,
    required this.pricing,
  });
}

class App extends ChangeNotifier {
  List<PopularFood> popularFoods = [
    PopularFood(imgPath: 'assets/icons/burger.png', name: 'Burgers'),
    PopularFood(imgPath: 'assets/icons/vegan.png', name: 'Vegan'),
    PopularFood(imgPath: 'assets/icons/pizza.png', name: 'Pizza'),
    PopularFood(imgPath: 'assets/icons/fries.png', name: 'Snacks'),
    PopularFood(imgPath: 'assets/icons/sushi.png', name: 'Sushi'),
    PopularFood(imgPath: 'assets/icons/pasta.png', name: 'Pasta'),
    PopularFood(imgPath: 'assets/icons/chicken.png', name: 'Chicken')
  ];

  List<FoodPlace> discountFoods = [
    FoodPlace(name: 'Big Man Burger', tags: ['Burgers', 'Snacks'], rating: 4.7, pricing: 30.00, imgPath: 'assets/images/burger_image.png'),
    FoodPlace(name: 'The Sheriff Fast Food', tags: ['Fried Rice', 'Jollof'], rating: 4.2, pricing: 20.00, imgPath: 'assets/images/friedrice.png'),
    FoodPlace(name: 'Asanka Avenue', tags: ['Local dishes'], rating: 4.8, pricing: 25.00, imgPath: 'assets/images/fufu.png'),
  ];

  List<FoodPlace> foodPlaces = [
    FoodPlace(name: 'Mesagevel\'s Kitchen', tags: ['Continental Dishes'], rating: 4.1, pricing: 50.00, imgPath: 'assets/images/spaghetti.png'),
    FoodPlace(name: 'Tara\'s Nigerian Kitchen', tags: ['Nigerian Cuisine'], rating: 4.2, pricing: 60.00, imgPath: 'assets/images/amala.png'),
    FoodPlace(name: 'Snack n Bites', tags: ['Snacks', 'Spring Rolls'], rating: 3.6, pricing: 40.00, imgPath: 'assets/images/springrolls.png'),
    FoodPlace(name: 'Abochi Suya', tags: ['Suya', 'Khebab'], rating: 4.0, pricing: 5.00, imgPath: 'assets/images/suya.png'),
    FoodPlace(name: 'London Pub', tags: ['Drinks', 'Khebab'], rating: 4.8, pricing: 20.00, imgPath: 'assets/images/bbq.png'),
    FoodPlace(name: 'The Slurp', tags: ['Snacks'], rating: 4.1, pricing: 25.00, imgPath: 'assets/images/shakes.png'),
    FoodPlace(name: 'Pizza Boy', tags: ['Pizza'], rating: 4.0, pricing: 40.00, imgPath: 'assets/images/pizza_image.png'),
    FoodPlace(name: 'Starbites Haatso', tags: ['Breakfast'], rating: 4.6, pricing: 40.00, imgPath: 'assets/images/waffles.png'),
    FoodPlace(name: 'Yaro Fast Food', tags: ['Fried Rice', 'Noodles'], rating: 4.8, pricing: 10.00, imgPath: 'assets/images/jollof.png'),
    FoodPlace(name: 'Barita\'s Restaurant Adenta', tags: ['Chinese Cuisine'], rating: 4.8, pricing: 40.00, imgPath: 'assets/images/chinesefood.png'),
    FoodPlace(name: 'Krusty Krab', tags: ['Burgers', 'Fries'], rating: 5.0, pricing: 20.00, imgPath: 'assets/images/kk.png'),
    FoodPlace(name: 'Mawusinu Foods', tags: ['Local dishes'], rating: 4.8, pricing: 15.00, imgPath: 'assets/images/banku.png')
  ];

  final List<FoodPlace> cart =[];

  void addToCart(FoodPlace foodItem, int foodQuantity) {
    for (int i = 0; i < foodQuantity; i++) {
      cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(FoodPlace foodItem) {
    cart.remove(foodItem);
    notifyListeners();
  }
}