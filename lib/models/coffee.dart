class Coffee {
  final String name;
  final String description;
  final double price;
  final String category;
  final DateTime launchDate;
  final bool glutenFree;

  final String imagePath;
  final bool isAssetImage;

  bool isFavorite;

  Coffee({
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.launchDate,
    required this.imagePath,
    this.isAssetImage = true,
    this.glutenFree = false,
    this.isFavorite = false,
  });
}
