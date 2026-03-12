import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_tutorial/todo_screen/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem({String? name}) {
    final item = Item(id: DateTime.now().toString(), name: name!);
    state.add(item);
    state = state.toList();
  }

  void removeItem({String? id}) {
    state.removeWhere((itemId) => itemId.id == id);
    state = state.toList();
  }

  void updateItem({String? id, String? updateText}) {
    final foundIndex = state.indexWhere((ids) => ids.id == id);
    state[foundIndex].name = updateText!;
    state = state.toList();
  }
}
