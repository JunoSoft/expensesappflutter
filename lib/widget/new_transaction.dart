import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
   NewTransaction({super.key});
final titleController = TextEditingController();
  final amountController = TextEditingController();
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
                          print(titleController.text +
                              ':' +
                              amountController.text);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        child: Text("Add Transaction"),
                      )
                    ],
                  ),
                ));
  }
}