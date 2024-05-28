import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions,{super.key});
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index){
           return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Rs. ${transactions[index].amount.toString()}',
                    style:TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueGrey
                    ),
                  ),

                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.lightBlue, width: 2, ),
                  ),
                  padding: EdgeInsets.all(10),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transactions[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, ),),
                    Text( DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, color: Colors.grey),),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
