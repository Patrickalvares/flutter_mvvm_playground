import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mvvm_playground/services/api_service.dart';
import 'package:flutter_mvvm_playground/view_models/currency_view_model.dart';
import 'package:flutter_mvvm_playground/views/currency_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrencyViewModel(
        apiService: ApiService(
            baseUrl: 'http://data.fixer.io/',
            apiKey: '51d53beb6842285a5c597148a732e679'),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CurrencyScreen(),
      ),
    );
  }
}
