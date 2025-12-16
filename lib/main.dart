import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AsiCoffeeApp());
}

class AsiCoffeeApp extends StatelessWidget {
  const AsiCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AsiCoffee',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        textTheme: GoogleFonts.poppinsTextTheme(),
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
  const HomePage({super.key});

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
    CoffeeItem(
      name: 'Cappuccino',
      price: 8.50,
      category: 'Cremoso',
      imageUrl:
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93',
    ),
    CoffeeItem(
      name: 'Latte',
      price: 7.50,
      category: 'Leve',
      imageUrl:
          'https://images.unsplash.com/photo-1523942839745-7848d7d5c66c',
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
        padding: const EdgeInsets.all(12),
        itemCount: coffeeList.length,
        itemBuilder: (context, index) {
          final item = coffeeList[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // IMAGEM
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      item.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // TEXTO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${item.price.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 6),
                        Chip(
                          label: Text(item.category),
                          backgroundColor: Colors.brown.shade100,
                        ),
                      ],
                    ),
                  ),

                  // FAVORITO (DIFERENCIAL COM ANIMAÇÃO)
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        item.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        key: ValueKey(item.isFavorite),
                        color: item.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        item.isFavorite = !item.isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
