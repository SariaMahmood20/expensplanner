import 'package:expensplanner/widgets/chart.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner',
      theme: ThemeData(

        primarySwatch: Colors.purple,
        canvasColor: Colors.amber,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction=[
    Transaction( id: 't1', title: 'New Shoes', amount: 5000, date: DateTime.now()),
    // Transaction( id: 't2', title: 'Weekly Groceries', amount: 6000, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransaction.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7),)
      );
    }).toList();
  }
  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate)
  {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(onTap: (){},child: NewTransaction(_addNewTransaction));
    },);
  }

  void _deleteTransaction(String id)
  {
    setState(() {
      _userTransaction.removeWhere((tx){
        return tx.id==id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Expense Planner'),
        actions: [
          IconButton(onPressed: ()=> _startAddNewTransaction(context), icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //Charts
            Chart(_recentTransactions),
            TransactionList(_userTransaction, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
          backgroundColor: Theme.of(context).canvasColor,
          shape: CircleBorder(eccentricity: 1),
          child: Icon(Icons.add, color: Colors.black, size: 28,),
          onPressed: ()=> _startAddNewTransaction(context),
        ),
    );
  }
}
