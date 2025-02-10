class StockModel {
  final String name;
  final dynamic price;

  StockModel({required this.name, required this.price});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      name: json['name'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
    );
  }
}
