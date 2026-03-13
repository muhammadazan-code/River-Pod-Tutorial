import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/stream_provider.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Stream Provider"))),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(streamProvider);
          return Center(
            child: provider.when(
              skipLoadingOnRefresh: false,
              data: (price) => Text(
                price.toString(),
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              error: (error, stack) => TextButton(
                onPressed: () {
                  ref.invalidate(streamProvider);
                },
                child: Text("Refresh"),
              ),
              loading: () => CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
