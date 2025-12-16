import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AsiCoffeeApp());
}

class AsiCoffeeApp extends StatelessWidget {
  const AsiCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AsiCoffee',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/* =========================
   MODEL
========================= */
class CoffeeItem {
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  bool isFavorite;

  CoffeeItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
  });
}

/* =========================
   HOME PAGE
========================= */
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
      name: 'Espresso',
      price: 5.00,
      category: 'Tradicional',
      imageUrl:
          'https://images.unsplash.com/photo-1511920170033-f8396924c348',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsiCoffee ☕'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: coffeeList.length,
        itemBuilder: (context, index) {
          final item = coffeeList[index];

          return ListTile(
            title: Text(item.name),
            subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(
                item.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              onPressed: () {
                setState(() {
                  item.isFavorite = !item.isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
