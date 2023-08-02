import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);
final cityProvider = Provider<String>((ref) {
  return 'Bahawalpur';
});
final countryProvider = Provider<String>((ref) {
  return 'Pakistan';
});
final colorProvider = StateProvider<Color>((ref) {
  return Colors.black;
});
