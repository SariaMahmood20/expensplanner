import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions, this.deletetx,{super.key});
  final List<Transaction> transactions;
  final Function deletetx;
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
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
                    leading: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7),),
                        border: Border.all(color: Theme.of(context).primaryColorDark, width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:  Text('Rs ${transactions[index].amount}', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark, fontSize: 18),),
                      ),
                    ),
                    title: Text(transactions[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100, color: Colors.grey),),
                    trailing: IconButton(onPressed:()=> deletetx(transactions[index].id), icon: Icon(Icons.delete, color: Colors.red,)),
                  ),
                );
              },
              itemCount: transactions.length,
            );
  }
}
