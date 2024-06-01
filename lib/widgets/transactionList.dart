import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions, {super.key});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'No transactions are added yet!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorDark),
                ),
                Image.asset(
                  'assets/images/zzz.png',
                  height: 200,
                  width: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorDark,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox
                          (child: Text('Rs ${transactions[index].amount}', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorLight),)),
                      ),
                    ),
                    title: Text(transactions[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100, color: Colors.grey),),

                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
