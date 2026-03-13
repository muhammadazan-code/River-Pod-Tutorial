ItemModel item = ItemModel(name: 'Yaqoob', favourite: false, id: 10001);

final names = item.copyWith(name: "Mosa");

class ItemModel {
  final String name;
  final int id;
  final bool favourite;

  // Constructor
  ItemModel({required this.name, required this.favourite, required this.id});

  ItemModel copyWith({String? name, int? id, bool? favourite}) {
    return ItemModel(
      name: name ?? this.name,
      favourite: favourite ?? this.favourite,
      id: id ?? this.id,
    );
  }
}
