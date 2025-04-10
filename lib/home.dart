import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_provider_riverpod/stream_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stockPriceProvider);
    print('Build');
    return Scaffold(
      appBar: AppBar(title: Text('Stock Provider')),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: provider.when(
              data:
                  (price) => Text(
                    price.toString(),
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
              error:
                  (error, stack) => TextButton(
                    onPressed: () {
                      ref.invalidate(stockPriceProvider);
                    },
                    child: Text('Error $error'),
                  ),
              loading: () => CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
