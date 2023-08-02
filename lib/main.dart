import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_first_day/providers/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print(ref.read(colorProvider).hashCode);
                print(ref.read(colorProvider).hashCode);

                return Container(
                  width: 200,
                  height: 200,
                  color: ref.watch(colorProvider),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                String city = ref.read(cityProvider);

                String country = ref.read(countryProvider);
                return Text('City: $city, Country: $country');
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(ref.watch(counterProvider).toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonBar(children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(colorProvider.notifier).state = Color.fromARGB(
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255));
          },
        ),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
        ),
      ]),
    );
  }
}
