class CurrencyConverter {
  static Map<String, dynamic> convertToBRL(Map<String, dynamic> rates) {
    final brlRate = rates['BRL'] ?? 1.0;

    return rates.map((key, value) {
      if (key == 'BRL') {
        return MapEntry(key, 1.0);
      } else {
        return MapEntry(key, brlRate / value);
      }
    });
  }
}
