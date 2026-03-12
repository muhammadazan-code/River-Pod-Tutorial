import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/todo_screen/item_provider.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("T o d o  A p p"))),
      body: items.isEmpty
          ? Text("Empty data")
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final itemDetails = items[index];
                return ListTile(
                  title: Text(itemDetails.name.toString()),
                  subtitle: Text(itemDetails.id.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .updateItem(
                                id: itemDetails.id,
                                updateText: "Updated",
                              );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .removeItem(id: itemDetails.id.toString());
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem(name: "New Item");
        },
        child: Text("Add"),
      ),
    );
  }
}
