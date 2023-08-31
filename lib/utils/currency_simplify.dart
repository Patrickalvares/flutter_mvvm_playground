import 'package:intl/intl.dart';

abstract class CurrencySimplify {
  static String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
        symbol: 'R\$ ', decimalDigits: 2, locale: 'pt_BR');
    return formatter.format(amount);
  }
}
