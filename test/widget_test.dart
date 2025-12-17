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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

// MODEL
class Coffee {
  final String name;
  final double price;
  final String image;
  final String category;
  final bool isFeatured; // 🔥 DIFERENCIAL

  bool isFavorite;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.isFeatured = false,
    this.isFavorite = false,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Coffee> coffees = [
    Coffee(
      name: 'Espresso',
      price: 5.00,
      image: 'assets/images/espresso.jpg',
      category: 'Tradicional',
    ),
    Coffee(
      name: 'Cappuccino',
      price: 8.50,
      image: 'assets/images/cappuccino.jpg',
      category: 'Cremoso',
      isFeatured: true, // ⭐ Destaque EJ
    ),
    Coffee(
      name: 'Latte',
      price: 7.50,
      image: 'assets/images/latte.jpg',
      category: 'Leve',
    ),
    Coffee(
      name: 'Mocha',
      price: 9.00,
      image: 'assets/images/mocha.jpg',
      category: 'Doce',
    ),
    Coffee(
      name: 'Americano',
      price: 6.00,
      image: 'assets/images/americano.jpg',
      category: 'Forte',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F2),
      appBar: AppBar(
        title: const Text('AsiCoffee ☕'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coffees.length,
        itemBuilder: (context, index) {
          final coffee = coffees[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // IMAGEM
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      coffee.image,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              coffee.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // ⭐ BADGE DIFERENCIAL
                            if (coffee.isFeatured)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  'Destaque EJ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Text(
                          'R\$ ${coffee.price.toStringAsFixed(2)}',
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.brown.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            coffee.category,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // FAVORITO
                  IconButton(
                    icon: Icon(
                      coffee.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: coffee.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        coffee.isFavorite = !coffee.isFavorite;
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
