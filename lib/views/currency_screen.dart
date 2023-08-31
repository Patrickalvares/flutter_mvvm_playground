import 'package:flutter/material.dart';
import 'package:flutter_mvvm_playground/view_models/currency_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<CurrencyViewModel>(context, listen: false).fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Currency Converter')),
      body: Consumer<CurrencyViewModel>(
        builder: (context, viewModel, child) {
          if (!viewModel.success) {
            return const Center(child: CircularProgressIndicator());
          }
          final rates = viewModel.currency?.rates ?? {};
          return ListView.builder(
            itemCount: rates.length,
            itemBuilder: (context, index) {
              final currencyCode = rates.keys.elementAt(index);
              final rate = rates[currencyCode];
              return ListTile(
                title: Text(
                  currencyCode,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  formatCurrency(rate),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

String formatCurrency(double amount) {
  final formatter =
      NumberFormat.currency(symbol: 'R\$ ', decimalDigits: 2, locale: 'pt_BR');
  return formatter.format(amount);
}
