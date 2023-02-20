import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionlist;
  const TransactionList({required this.transactionlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactionlist.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('No transaction added yet!'),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/emptyimage1.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemCount: transactionlist.length,
                itemBuilder: (context, index) => Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FittedBox(
                                  child: Text(
                                      '\$ ${transactionlist[index].amount}'))),
                        ),
                        title: Text(
                          transactionlist[index].title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 129, 134, 1)),
                        ),
                        subtitle: Text(DateFormat.yMMMMd()
                            .format(transactionlist[index].date)),
                      ),
                    )));
  }
}
