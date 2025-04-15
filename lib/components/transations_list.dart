import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransitionsList extends StatelessWidget {
  final List<Transaction> transations;

  const TransitionsList(this.transations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child:
          transations.isEmpty
              ? Column(
                children: <Widget>[
                  Text(
                    "Nenhuma transacao cadastrada",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset('assets/images/none.png'),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: transations.length,
                itemBuilder: (context, index) {
                  final transation = transations[index];
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '${transation.value.toStringAsFixed(2)} MT',
                            style: Theme.of(context).textTheme.titleMedium,
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
                  );
                },
              ),
    );
  }
}
