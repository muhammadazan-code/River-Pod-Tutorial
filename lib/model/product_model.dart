class ProductModel {
  String imageCard, imageDetail, name, specialItems, category;
  double price, rate;

  ProductModel({
    required this.category,
    required this.imageCard,
    required this.imageDetail,
    required this.name,
    required this.price,
    required this.rate,
    required this.specialItems,
  });
  List<ProductModel> foodProduct = [
    ProductModel(
      imageCard: 'assets/food-delivery/product/beef_burger.png',
      imageDetail: 'assets/food-delivery/product/beef_burger1.png',
      name: 'Beef Burger',
      price: 7.59,
      rate: 4.5,
      specialItems: 'Cheesy Mozarella 🧀',
      category: 'Burger',
    ),
    ProductModel(
      imageCard: 'assets/food-delivery/product/double_burger.png',
      imageDetail: 'assets/food-delivery/product/double_burger1.png',
      name: 'Double Burger',
      price: 10.0,
      rate: 4.9,
      specialItems: 'Double Beef 🍖',
      category: 'Burger',
    ),
    ProductModel(
      imageCard: 'assets/food-delivery/product/cheese-burger.png',
      imageDetail: 'assets/food-delivery/product/cheese-burger1.png',
      name: 'Cheese Burger',
      price: 8.88,
      rate: 4.8,
      specialItems: 'Extra Cheese 🧀',
      category: 'Burger',
    ),
    ProductModel(
      imageCard: 'assets/food-delivery/product/bacon_burger.png',
      imageDetail: 'assets/food-delivery/product/bacon_burger1.png',
      name: 'Bacon Burger',
      price: 9.99,
      rate: 5.0,
      specialItems: 'Mix Beef 🥩',
      category: 'Burger',
    ),
    ProductModel(
      imageCard: 'assets/food-delivery/product/pizza111.png',
      imageDetail: 'assets/food-delivery/product/pizza.png',
      name: 'Chicken Pizza',
      price: 19.99,
      rate: 4.0,
      specialItems: 'Cheese Pizza 🍕',
      category: 'Pizza',
    ),
    ProductModel(
      imageCard: 'assets/food-delivery/product/cup_cake.png',
      imageDetail: 'assets/food-delivery/product/cup-cake1.png',
      name: 'Cream Cake',
      price: 5.99,
      rate: 4.7,
      specialItems: 'Mix Cream 🧁',
      category: 'Cup Cake',
    ),
  ];
  var desc =
      "This is a special types of tiems, often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'specialItems sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns.";
}
