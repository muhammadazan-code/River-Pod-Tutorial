import 'package:flutter_riverpod/legacy.dart';

final multiProvider = StateProvider.family<int, int>((ref, number) {
  return number * 2;
});
final mulProvider = StateProvider.family<int, Map<String, dynamic>>((
  ref,
  number,
) {
  return number['id'] * 9;
});
