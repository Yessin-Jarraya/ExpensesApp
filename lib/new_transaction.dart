import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount<=0)
      return;
    widget.addTx(
      enteredTitle,
      enteredAmount,

    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (val)=>{
              //   titleInput=val,
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onChanged: (val)=>titleInput=val,
              onSubmitted:(_)=>submitData(),
            ),
            TextButton(
              onPressed: () {
                submitData();
              },
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(foregroundColor: Colors.purpleAccent),
            ),
          ],
        ),
      ),
    );
  }
}
