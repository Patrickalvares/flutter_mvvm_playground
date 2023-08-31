class ExchangeRates {
  final bool success;
  final int timestamp;
  final String base;
  final String date;
  Map<String, dynamic> rates;

  ExchangeRates({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.date,
    required this.rates,
  });

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    return ExchangeRates(
      success: json['success'],
      timestamp: json['timestamp'],
      base: json['base'],
      date: json['date'],
      rates: Map<String, dynamic>.from(json['rates']),
    );
  }
}
