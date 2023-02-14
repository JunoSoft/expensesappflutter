import 'package:flutter/material.dart';

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
      home:  _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:const  Text("Expenses App"),
      ),
      body: Center(

        child: Column(
          
          children: <Widget>[
           
          ],
        ),
      ),
    
    );
  }
}
