import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockPriceProvider = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0;

  while (true) {
    await Future.delayed(Duration(seconds: 1));
    currentPrice += random.nextDouble() * 4 - 2;
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
