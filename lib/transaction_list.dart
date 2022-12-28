import 'dart:ffi';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('9ayed 7aja chritha' ,
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 20,),
                  Container(height: 250,
                      child: Image.asset('assets/images/Waiting.png', fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Color(0xFFf5ebe0),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightBlueAccent,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xEE5a189a),
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  '${transactions[index].amount.toStringAsFixed(2)}' +
                                      'Dinar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColor)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactions[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                                Text(
                                  DateFormat(' EEEE, d MMMM ')
                                      .format(transactions[index].date),
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                      ));
                },
                itemCount: transactions.length,
              ));
  }
}
