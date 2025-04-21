import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index){
      final weekday = DateTime.now().subtract(Duration(days: 4));

      double totalSum = 0;
      for(var i=0; i<recentTransactions.length;i++){
        bool sameDay = recentTransactions[i].date.day == weekday.day;
        bool sameMonth = recentTransactions[i].date.month == weekday.month;
        bool sameYear = recentTransactions[i].date.year == weekday.year;
        if(sameDay && sameMonth && sameYear){
          totalSum+=recentTransactions[i].value;
        }

      }
      return {'day':DateFormat.E().format(weekday)[0], 'value':totalSum };
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [

        ],
      ),
    )
  }

}