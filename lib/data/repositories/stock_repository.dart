import 'package:dio/dio.dart';

import '../../core/shared_prefs.dart';
import '../models/stock_model.dart';

class StockRepository {
  final Dio dio = Dio();

  Future<List<StockModel>> searchStocks(String query) async {
    final token = await SharedPrefs.getAuthToken();
    if (token == null) throw Exception("User not authenticated");

    try {
      final response = await dio.get(
        'https://illuminate-production.up.railway.app/api/stocks/search?query=$query',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return (response.data as List).map((stock) => StockModel.fromJson(stock)).toList();
    } catch (e) {
      throw Exception("Stock search failed: ${e.toString()}");
    }
  }
}
