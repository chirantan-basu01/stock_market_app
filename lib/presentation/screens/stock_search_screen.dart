import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../blocs/stock_bloc/stock_bloc.dart';
import '../blocs/stock_bloc/stock_event.dart';
import '../blocs/stock_bloc/stock_state.dart';
import '../widgets/stock_item.dart';
import 'login_screen.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({super.key});

  @override
  _StockSearchScreenState createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      final query = searchController.text.trim();
      if (query.isEmpty) {
        context.read<StockBloc>().add(ClearStocks());
      } else {
        searchStocks(context);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  void searchStocks(BuildContext context) {
    final query = searchController.text.trim();
    if (query.isEmpty) {
      context.read<StockBloc>().add(ClearStocks());
    } else {
      context.read<StockBloc>().add(SearchStocks(query: query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Search",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              context.read<AuthBloc>().add(Logout());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                onChanged: (_) => searchStocks(context),
                decoration: InputDecoration(
                  labelText: "Search Stocks",
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.blueAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<StockBloc, StockState>(
                builder: (context, state) {
                  if (state is StockLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is StockFailure) {
                    return Center(
                      child: Text(state.error,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16)),
                    );
                  } else if (state is StockSuccess) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      itemCount: state.stocks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: StockItem(stock: state.stocks[index]),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text("Search for stocks",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
