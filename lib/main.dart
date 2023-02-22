import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final dynamic appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Expenses App"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
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
    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(
            transactionlist: _transactions,
            removeTransaction: _deleteTransaction));
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show Chart',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch.adaptive(
                      value: _showChart,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandscape)
              Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.3,
                  child: Chart(recentTransactions: _recentTransaction)),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(recentTransactions: _recentTransaction))
                  : txListWidget,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
