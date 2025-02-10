import 'package:equatable/equatable.dart';

abstract class StockEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchStocks extends StockEvent {
  final String query;

  SearchStocks({required this.query});

  @override
  List<Object?> get props => [query];
}
