import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:stock_market_app/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:stock_market_app/presentation/blocs/stock_bloc/stock_bloc.dart';
import 'package:stock_market_app/presentation/blocs/stock_details_bloc/stock_details_bloc.dart';
import 'package:stock_market_app/presentation/screens/login_screen.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/stock_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: AuthRepository())..add(CheckLoginStatus())),
        BlocProvider(create: (context) => StockBloc(stockRepository: StockRepository())),
        BlocProvider(create: (context) => StockDetailsBloc(stockRepository: StockRepository())),
      ],
      child: const MaterialApp(
        title: 'Stock Market App',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
