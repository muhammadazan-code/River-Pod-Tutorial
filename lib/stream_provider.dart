import 'dart:math';

import 'package:riverpod/riverpod.dart';

final streamProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0; // Starting price
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
