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
        scaffoldBackgroundColor: const Color(0xFFFFF7F2),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

// MODELO DO CAFÉ
class Coffee {
  final String name;
  final double price;
  final String image;
  final String category;
  bool isFavorite;

  Coffee({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    this.isFavorite = false,
  });
}

// TELA PRINCIPAL
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Coffee> coffeeList = [
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
      category: 'Suave',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsiCoffee ☕'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: coffeeList.length,
        itemBuilder: (context, index) {
          final coffee = coffeeList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEFE6),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    coffee.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffee.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${coffee.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade200,
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
          );
        },
      ),
    );
  }
}
