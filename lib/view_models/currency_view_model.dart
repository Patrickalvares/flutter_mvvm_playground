import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_playground/models/currency_model.dart';
import 'package:flutter_mvvm_playground/services/api_service.dart';
import 'package:flutter_mvvm_playground/utils/currency_coverter.dart';

class CurrencyViewModel extends ChangeNotifier {
  final ApiService apiService;

  ExchangeRates? _currency;
  ExchangeRates? get currency => _currency;
  bool isSuccessed = false;
  bool get success => _currency?.success ?? false;
  int? _timestamp;
  int? get timestamp => _timestamp;

  CurrencyViewModel({required this.apiService});

  Future<void> fetchCurrencies() async {
    try {
      final response = await apiService.fetchCurrencies();
      _currency = ExchangeRates.fromJson(response);
      _convertRatesToBRLBase();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching currencies: $e");
      }
    }
  }

  void _convertRatesToBRLBase() {
    if (_currency != null) {
      final updatedRates = CurrencyConverter.convertToBRL(_currency!.rates);
      print(updatedRates);
      _currency = ExchangeRates(
        timestamp: _currency!.timestamp,
        success: _currency!.success,
        base: _currency!.base,
        date: _currency!.date,
        rates: updatedRates,
      );
    }
  }
}
