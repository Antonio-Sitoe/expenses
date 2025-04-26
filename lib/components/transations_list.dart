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
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/none.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemCount: transations.length,
                itemBuilder: (context, index) {
                  final tr = transations[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: ListTile(
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(child: Text("${tr.value}")),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
