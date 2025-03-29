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
          Column(
            children:
                _transations
                    .map(
                      (transation) => Card(
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                '${transation.value.toStringAsFixed(2)} MT',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transation.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM y').format(transation.date),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(decoration: InputDecoration(labelText: "Titulo")),
                  TextField(
                    decoration: InputDecoration(labelText: "Valor em MT"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        onPressed: () {},
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
