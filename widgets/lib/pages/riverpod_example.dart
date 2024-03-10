import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/main.dart';
import 'package:widgets/theme/light_dark_theme.dart';

class RiverpodExample extends StatelessWidget {
  const RiverpodExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: ProviderScope(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text('Slidable widget'),
            centerTitle: true,
          ),
          body: Center(child: CounterWidget()),
        ),
      ),
    );
  }
}

// 1. State Provider
final counterProvider = StateProvider<int>((ref) => 0);

// 2. Counter Widget
class CounterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('$count', style: const TextStyle(fontSize: 100)),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: const Text('+'),
            ),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state--,
              child: const Text('-'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
                ;
              },
              child: const Text('Go To Main',
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
