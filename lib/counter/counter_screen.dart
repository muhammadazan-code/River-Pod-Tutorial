import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider((ref) => 0);
final swichValue = StateProvider((ref) => false);

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("Build 1");
    }
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App"))),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final a = ref.watch(counter);
              if (kDebugMode) {
                print("Build 2");
              }
              return Center(child: Text(a.toString()));
            },
          ),
          Divider(),
          Consumer(
            builder: (context, ref, child) {
              final b = ref.watch(swichValue);
              if (kDebugMode) {
                print("Build 3");
              }
              return Switch(
                value: b,
                onChanged: (value) {
                  ref.read(swichValue.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Stateful Widget
class CounterApp extends ConsumerStatefulWidget {
  const CounterApp({super.key});

  @override
  ConsumerState<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends ConsumerState<CounterApp> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Build 1");
    }
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App"))),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final a = ref.watch(counter);
              if (kDebugMode) {
                print("Build 2");
              }
              return Center(child: Text(a.toString()));
            },
          ),
          Divider(),
          Consumer(
            builder: (context, ref, child) {
              final b = ref.watch(swichValue);
              if (kDebugMode) {
                print("Build 3");
              }
              return Switch(
                value: b,
                onChanged: (value) {
                  ref.read(swichValue.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
