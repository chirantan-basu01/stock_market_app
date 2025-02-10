import 'package:flutter/material.dart';

class StockDetailsScreen extends StatelessWidget {
  final String stockName;
  const StockDetailsScreen({super.key, required this.stockName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stockName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(stockName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Placeholder(
                fallbackHeight: 200, fallbackWidth: double.infinity),
            const SizedBox(height: 20),
            const Text("Stock Price Graph will be displayed here"),
          ],
        ),
      ),
    );
  }
}
