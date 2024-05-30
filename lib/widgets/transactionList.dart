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
      child:transactions.isEmpty?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('No transactions are added yet!',
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColorDark
          ),),
          Image.asset('assets/images/zzz.png', height: 200,width: 200,)
        ],
      )
      : ListView.builder(
        itemBuilder: (ctx, index){
           return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Rs. ${transactions[index].amount.toString()}',
                    style:TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).primaryColorDark
                    ),
                  ),

                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColorDark, width: 2, ),
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
