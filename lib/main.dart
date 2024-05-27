import 'package:flutter/material.dart';
import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),

      body: Column(
        children: [
          //Charts
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child:
               Text('Chart'),
            elevation: 5,),
          ),
          //Adding a new Transaction

          NewTransaction(),
          //Transactions
          TransactionList(),
        ],
      ),
    );
  }
}
