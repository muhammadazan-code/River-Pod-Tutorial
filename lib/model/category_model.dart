class CategoryModel {
  String image, name;

  CategoryModel({required this.image, required this.name});

  List<CategoryModel> myCategory = [
    CategoryModel(image: 'assets/food-delivery/burger.png', name: 'Burger'),
    CategoryModel(
      image: 'assets/food-delivery/product/pizza.png',
      name: 'Pizza',
    ),
    CategoryModel(
      image: 'assets/food-delivery/product/cup cake.png',
      name: 'Cup Cake',
    ),
  ];

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(image: json['image'] ?? '', name: json['name'] ?? '');
  }
}
