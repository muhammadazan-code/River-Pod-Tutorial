import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/api/post_provider.dart';

class TScreen extends ConsumerWidget {
  const TScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("A P I"))),
      body: Center(
        child: postList.when(
          skipLoadingOnRefresh: true,
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                child: ListTile(
                  title: Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                    item.body,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                ),
              );
            },
          ),
          error: (error, stack) => TextButton(
            onPressed: () {
              ref.invalidate(postProvider);
            },
            child: Text("Refresh"),
          ),
          loading: () =>
              Center(child: CircularProgressIndicator(color: Colors.blue)),
        ),
      ),
    );
  }
}
