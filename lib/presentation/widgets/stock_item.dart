import 'package:flutter/material.dart';

import '../../data/models/stock_model.dart';
import '../screens/stock_details_screen.dart';

class StockItem extends StatelessWidget {
  final StockModel stock;
  const StockItem({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(stock.name),
      subtitle: Text("\$${stock.price.toStringAsFixed(2)}"),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => StockDetailsScreen(stockName: stock.name)),
        );
      },
    );
  }
}
