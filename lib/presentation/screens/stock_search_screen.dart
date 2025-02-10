import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/stock_bloc/stock_bloc.dart';
import '../blocs/stock_bloc/stock_event.dart';
import '../blocs/stock_bloc/stock_state.dart';
import '../widgets/stock_item.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({super.key});

  @override
  _StockSearchScreenState createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  void searchStocks(BuildContext context) {
    final query = searchController.text;
    if (query.isNotEmpty) {
      context.read<StockBloc>().add(SearchStocks(query: query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stock Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: (_) => searchStocks(context),
              decoration: const InputDecoration(
                  labelText: "Search Stocks", prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: BlocBuilder<StockBloc, StockState>(
              builder: (context, state) {
                if (state is StockLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is StockFailure) {
                  return Center(child: Text(state.error));
                } else if (state is StockSuccess) {
                  return ListView.builder(
                    itemCount: state.stocks.length,
                    itemBuilder: (context, index) {
                      return StockItem(stock: state.stocks[index]);
                    },
                  );
                }
                return const Center(child: Text("Search for stocks"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
