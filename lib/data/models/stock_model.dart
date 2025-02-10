class StockModel {
  final int id;
  final String name;
  final String symbol;
  final double price;
  final double change;
  final String sector;
  final String description;

  StockModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.sector,
    required this.description,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
      change: json['change'] != null ? (json['change'] as num).toDouble() : 0.0,
      sector: json['sector'] ?? "N/A",
      description: json['description'] ?? "No description available",
    );
  }
}
