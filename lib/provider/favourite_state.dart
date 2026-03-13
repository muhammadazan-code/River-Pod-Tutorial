import 'package:riverpod_tutorial/model/item_model.dart';

class FavouriteState {
  final List<ItemModel> allItems;
  final List<ItemModel> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.filteredItems,
    required this.search,
  });

  FavouriteState copyWith({
    List<ItemModel>? allItems,
    List<ItemModel>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }
}
