import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionlist;
  final Function removeTransaction;
  const TransactionList(
      {required this.transactionlist,
      required this.removeTransaction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          style: const TextStyle(
                              color: Color.fromARGB(255, 129, 134, 1)),
                        ),
                        subtitle: Text(DateFormat.yMMMMd()
                            .format(transactionlist[index].date)),
                        trailing: IconButton(
                          onPressed: () =>
                              removeTransaction(transactionlist[index].id),
                          icon:const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    )));
  }
}
