import 'package:expenses/components/transations_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Expenses")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(elevation: 5, color: Colors.blue, child: Text("Chart")),
          ),
          TransitionsList(_transations),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "Titulo"),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(labelText: "Valor em MT"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          print(valueController.text);
                        },
                        child: Text('Nova transacao'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
