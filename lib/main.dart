import 'package:flutter/material.dart';

void main() {
  runApp(const AsicoffeeApp());
}

class AsicoffeeApp extends StatelessWidget {
  const AsicoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asicoffee',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asicoffee'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Bem-vindo ao Asicoffee ☕',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}


