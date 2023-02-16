import './model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widget/transaction_list.dart';

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
  
  final titleController = TextEditingController();
  final amountController = TextEditingController();
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
                      TextField(
                        decoration: const InputDecoration(labelText: 'Title'),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(titleController.text +
                              ':' +
                              amountController.text);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: Text("Add Transaction"),
                      )
                    ],
                  ),
                )),
           TransactionList(),
          ],
        ),
      ),
    );
  }
}
