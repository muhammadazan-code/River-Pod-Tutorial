import 'package:riverpod/legacy.dart';
import 'package:riverpod_tutorial/model/item_model.dart';
import 'package:riverpod_tutorial/provider/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<ItemModel> items = [
      ItemModel(name: "MacBook", favourite: true, id: 1001),
      ItemModel(name: "Samsung", favourite: false, id: 1002),
      ItemModel(name: "Laptop", favourite: true, id: 1003),
      ItemModel(name: "Earbuds", favourite: false, id: 1004),
      ItemModel(name: "CPU", favourite: true, id: 1005),
    ];

    state = state.copyWith(
      allItems: items.toList(),
      filteredItems: items.toList(),
    );
  }

  void filter(String query) {
    state = state.copyWith(filteredItems: filterItems(state.allItems, query));
  }

  List<ItemModel> filterItems(List<ItemModel> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }

  List<ItemModel> _favouriteItem(List<ItemModel> items, String option) {
    if (option == "All") {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }
}
