import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transaction = [
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Shoes'),
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Car'),
  ];
  @override
  Widget build(BuildContext context) {
    return   Column(
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
            }).toList());
  }
}