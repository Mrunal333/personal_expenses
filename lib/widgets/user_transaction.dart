import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_lists.dart';

class UserTransactions extends StatefulWidget {

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransactions>{

  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new dress',
      amount: 500.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'weekly Groceries',
      amount: 2000.00,
      date: DateTime.now(),
    )

  ];
  void _addNewTransaction(String txTitle, double txAmount){
    final newTx =Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Column(
     children: [
       NewTransaction(_addNewTransaction),
       TransactionList(_userTransaction)
     ],

   );
  }

}
