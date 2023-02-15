import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Car'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses App"),
      ),
      body: Center(
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
            Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      const TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Add Transaction"),
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                      )
                    ],
                  ),
                )),
            Column(
                children: transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 3,
                      )),
                      child: Text('\$ ${tx.amount}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              tx.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 124, 77, 1)),
                            )),
                        Text(
                          DateFormat.yMMMMd().format(tx.date),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
