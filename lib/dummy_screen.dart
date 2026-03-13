import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/family_builder.dart';

class DummyScreen extends ConsumerWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(mulProvider({'id': 20, "Name": "Azan"}));
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Family Provider"))),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(result.toString())],
          ),
        ),
      ),
    );
  }
}
