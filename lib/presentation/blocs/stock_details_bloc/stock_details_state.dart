part of 'stock_details_bloc.dart';

abstract class StockDetailsState {}

class StockDetailsInitial extends StockDetailsState {}

class StockDetailsLoading extends StockDetailsState {}

class StockDetailsLoaded extends StockDetailsState {
  final StockModel stock;

  StockDetailsLoaded({required this.stock});
}

class StockDetailsError extends StockDetailsState {
  final String message;

  StockDetailsError({required this.message});
}
