import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/search_provider.dart';

// To read constant value.
// final name = Provider<String>((ref) => "Azan");
// final age = Provider<int>((ref) => 20);
// final country = Provider<String>((ref) => "Pakistan");

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final a = ref.watch(name);
//     final b = ref.watch(age);
//     final c = ref.watch(country);
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text(a))),
//       body: ListTile(title: Text(a), subtitle: Text("$b\n$c")),
//     );
//   }
// }

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final a = ref.watch(name);
//     final b = ref.watch(age);
//     final c = ref.watch(country);
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text(a))),
//       body: ListTile(title: Text(a), subtitle: Text("$b\n$c")),
//     );
//   }
// }
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("object");
    }
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Search Provider"))),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              if (kDebugMode) {
                print("Text Form Field");
              }
              final search = ref.watch(
                searchProvider.select((state) => state.search),
              );
              return Text(search);
            },
          ),
          Divider(),
          Consumer(
            builder: (context, ref, child) {
              if (kDebugMode) {
                print("Switch");
              }
              final search = ref.watch(
                searchProvider.select((state) => state.isChanged),
              );
              return Switch(
                value: search,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
