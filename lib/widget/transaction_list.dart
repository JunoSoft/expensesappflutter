import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> transactionlist;
   const TransactionList({required this.transactionlist,super.key});

 
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:300,
      child:ListView.builder(
      itemCount: transactionlist.length,
          itemBuilder: (context, index) => Card(
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
                      child: Text('\$ ${transactionlist[index].amount}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              transactionlist[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 124, 77, 1)),
                            )),
                        Text(
                          DateFormat.yMMMMd().format(transactionlist[index].date),
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ))
    ); 
                
  }
}