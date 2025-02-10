part of 'stock_details_bloc.dart';

abstract class StockDetailsEvent {}

class FetchStockDetails extends StockDetailsEvent {
  final int stockId;

  FetchStockDetails({required this.stockId});
}
