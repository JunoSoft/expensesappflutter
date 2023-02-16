import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widget/transaction_list.dart';
import './model/transaction.dart';
import './widget/new_transaction.dart';
import './widget/user_transactions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: const Card(
                  child: Text('App 1 Test'),
                  color: Colors.blue,
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}
