import './newTransaction.dart';
import './transactionList.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction=[
    Transaction( id: 't1', title: 'New Shoes', amount: 5000, date: DateTime.now()),
    Transaction( id: 't2', title: 'Weekly Groceries', amount: 6000, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount)
  {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now()
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
