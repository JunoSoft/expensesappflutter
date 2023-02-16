import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;
  NewTransaction({required this.addNewTransaction, super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  addNewTransaction(
                      txTitle: titleController.text,
                      txAmount: double.parse(amountController.text));
                },
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                child: const Text("Add Transaction"),
              )
            ],
          ),
        ));
  }
}
