import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final sliderProvider = StateProvider<AppState>(
  (ref) => AppState(slidder: 0.3, showPassword: false),
);

class SliderScreen extends ConsumerWidget {
  const SliderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("Build 1");
    }
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("S L I D D E R"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final showpassword = ref.watch(
                  sliderProvider.select((state) => state.showPassword),
                );
                if (kDebugMode) {
                  print("Eye");
                }
                return InkWell(
                  onTap: () {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(
                      showPassword: !showpassword,
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: showpassword
                        ? Icon(Icons.remove_red_eye)
                        : Icon(CupertinoIcons.eye_slash),
                  ),
                );
              },
            ),
            Divider(),
            Consumer(
              builder: (context, ref, child) {
                final a = ref.watch(
                  sliderProvider.select((state) => state.slidder),
                );
                if (kDebugMode) {
                  print("Container");
                }
                return Container(
                  height: 400,
                  width: 400,
                  color: Colors.red.withOpacity(a),
                );
              },
            ),
            Divider(),
            Consumer(
              builder: (context, ref, child) {
                final slidder = ref.watch(
                  sliderProvider.select((state) => state.slidder),
                );
                if (kDebugMode) {
                  print("Slidder");
                }
                return Slider(
                  value: slidder,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(
                      slidder: value,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppState {
  final double slidder;
  final bool showPassword;

  AppState({required this.slidder, required this.showPassword});

  AppState copyWith({double? slidder, bool? showPassword}) {
    return AppState(
      slidder: slidder ?? this.slidder,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
