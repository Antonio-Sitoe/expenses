import 'dart:math';
import 'package:expenses/components/transations_list.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transations = [
    Transaction(
      id: "123",
      date: DateTime.now(),
      value: 321,
      title: "Novo Tenis de corrida",
    ),
    Transaction(
      id: "12",
      date: DateTime.now(),
      value: 567,
      title: "Novo Carro de corrida",
    ),
    Transaction(
      id: "1",
      date: DateTime.now(),
      value: 987,
      title: "Novo Ferrari de corrida",
    ),
    Transaction(
      id: "124",
      date: DateTime.now(),
      value: 32,
      title: "Novo Toyota de corrida",
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransition = Transaction(
      id: Random().nextDouble().toString(),
      date: DateTime.now(),
      value: value,
      title: title,
    );

    setState(() {
      _transations.add(newTransition);
    });

    Navigator.of(context);
  }

  _openTransactionFormModal(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        },
      );
    });
  }

  // _openTransactionFormModal(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (ctx) {
  //       return TransactionForm(_addTransaction);
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text("Chart"),
              ),
            ),
            TransitionsList(_transations),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _openTransactionFormModal(context),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
