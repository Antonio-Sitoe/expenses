import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transations_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(elevation: 5, color: Colors.blue, child: Text("Chart")),
        ),
        TransitionsList(_transations),
        TransactionForm(),
      ],
    );
  }
}
