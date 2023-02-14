import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Shoes'),
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Shoes'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                child: Text('App 1 Test'),
                color: Colors.blue,
              ),
            ),
            const Card(
              child: Text('App 1 Test'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
