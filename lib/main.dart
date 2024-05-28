import 'package:expensplanner/widgets/userTransaction.dart';
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
      debugShowCheckedModeBanner: false,
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
        backgroundColor: Colors.blueAccent,
        title: Text('Expense Planner'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),

      body: Column(
        children: [
          //Charts
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blueAccent,
              child:
               Text('Chart'),
            elevation: 5,),
          ),

          //Adding a new Transaction
          UserTransaction(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        shape: CircleBorder(eccentricity: 1),
        child: Icon(Icons.add, color: Colors.white, size: 28,),
        onPressed: (){},
      ),
    );
  }
}
