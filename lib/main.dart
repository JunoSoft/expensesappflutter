import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widget/new_transaction.dart';
import './model/transaction.dart';
import './widget/transaction_list.dart';
import 'widget/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        appBarTheme:
            AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith()),
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   titleSmall: const TextStyle(
        //     fontFamily: 'OpenSans',
        //     fontSize: 18,
        //     fontWeight: FontWeight.bold
        //   ),
        //   button: const TextStyle(color: Colors.white)
        // )
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //     amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Shoes'),
    // Transaction(
    //     amount: 68.99, date: DateTime.now(), id: 'X5667', title: 'New Car'),
  ];
  bool _showChart = false;
  List<Transaction> get _recentTransaction {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _newTransaction(
      {required double txAmount,
      required String txTitle,
      required DateTime txDate}) {
    final tx = Transaction(
        amount: txAmount,
        date: txDate,
        id: DateTime.now().toString(),
        title: txTitle);
    setState(() {
      _transactions.add(tx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: NewTransaction(addNewTransaction: _newTransaction),
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Expenses App"),
      actions: <Widget>[
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Show Chart'),
                Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
              ],
            ),
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                    child: Chart(recentTransactions: _recentTransaction))
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: TransactionList(
                        transactionlist: _transactions,
                        removeTransaction: _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
