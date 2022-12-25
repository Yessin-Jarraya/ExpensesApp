import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 52.2, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New watch ', amount: 100, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
              child: Container(
                child: Text('chart'),
                width: double.infinity,
              ),
              color: Colors.lightGreenAccent,
              shadowColor: Colors.blue,
              elevation: 5,
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child:
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [Container(margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 1,
                            ),),
                          padding: EdgeInsets.all(10),
                          child:
                          Text(tx.amount.toString()+'Dinar', style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple)),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tx.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.lightGreen),),
                              Text(tx.date.toString(),style: TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    )
                );
              }).toList(),
            ),
          ],
        ));
  }
}
