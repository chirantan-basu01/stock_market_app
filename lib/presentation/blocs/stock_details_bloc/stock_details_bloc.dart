import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/stock_model.dart';
import '../../../data/repositories/stock_repository.dart';

part 'stock_details_event.dart';
part 'stock_details_state.dart';

class StockDetailsBloc extends Bloc<StockDetailsEvent, StockDetailsState> {
  final StockRepository stockRepository;

  StockDetailsBloc({required this.stockRepository}) : super(StockDetailsInitial()) {
    on<FetchStockDetails>((event, emit) async {
      emit(StockDetailsLoading());
      try {
        final stock = await stockRepository.getStockDetails(event.stockId);
        emit(StockDetailsLoaded(stock: stock));
      } catch (e) {
        emit(StockDetailsError(message: e.toString()));
      }
    });
  }
}
