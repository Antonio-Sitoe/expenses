import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionForm extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  style: TextButton.styleFrom(foregroundColor: Colors.blue),
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
    );
  }
}
