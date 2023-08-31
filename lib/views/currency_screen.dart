import 'package:flutter/material.dart';
import 'package:flutter_mvvm_playground/utils/currency_simplify.dart';
import 'package:flutter_mvvm_playground/view_models/currency_view_model.dart';
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
      appBar: AppBar(title: const Text('Conversor de Moedas')),
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
              return Container(
                color: index % 2 == 0 ? Colors.grey[900] : Colors.grey[800],
                child: ListTile(
                  title: Text(
                    currencyCode,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    CurrencySimplify.formatCurrency(rate),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
