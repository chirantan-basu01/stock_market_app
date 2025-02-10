import 'package:equatable/equatable.dart';
import '../../../data/models/stock_model.dart';

abstract class StockState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockSuccess extends StockState {
  final List<StockModel> stocks;

  StockSuccess({required this.stocks});

  @override
  List<Object?> get props => [stocks];
}

class StockFailure extends StockState {
  final String error;

  StockFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
