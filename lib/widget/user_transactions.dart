import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Shoes'),
    Transaction(
        amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Car'),
  ];
  void _newTransaction({required double txAmount, required String txTitle}) {
    final tx = Transaction(
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTransaction: _newTransaction),
        TransactionList(transactionlist: transactions),
      ],
    );
  }
}
