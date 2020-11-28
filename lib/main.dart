import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transaction = [
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child:Text('CHART !'),
                 elevation: 10,
        ),
        ),
       Column(
         children: transaction.map((tx) {
         return Card(
             child: Row(
               children: [
               Container(
                 margin: EdgeInsets.symmetric(
                 vertical: 20,
                 horizontal: 15,
                 ),
                 decoration: BoxDecoration(
                     border: Border.all(
                         color:  Colors.purple,
                         width: 2
                     )
                 ),
                 padding: EdgeInsets.all(10),
                 child: Text('₹ ' + tx.amount.toString(),
                  /* child: Text('\₹₹{tx.amount}',*/
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                       color: Colors.purple,
                   ),
               ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     tx.title,
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                   Text(
                       tx.date.toIso8601String(),
                       style: TextStyle(
                         color: Colors.grey
                       ),
                   ),
               ],
               ),
             ],),
         );
       }) .toList(),)
        ],
        ),
    );
  }
}
