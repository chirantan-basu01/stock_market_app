import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/stock_repository.dart';
import 'stock_event.dart';
import 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final StockRepository stockRepository;

  StockBloc({required this.stockRepository}) : super(StockInitial()) {
    on<SearchStocks>((event, emit) async {
      emit(StockLoading());

      try {
        final stocks = await stockRepository.searchStocks(event.query);
        emit(StockSuccess(stocks: stocks));
      } catch (e) {
        emit(StockFailure(error: e.toString()));
        log('Error in stock bloc : ${e.toString()}');
      }
    });
  }
}
