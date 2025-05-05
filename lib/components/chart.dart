import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: 4));

      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekday.day;
        bool sameMonth = recentTransactions[i].date.month == weekday.month;
        bool sameYear = recentTransactions[i].date.year == weekday.year;
        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }
      return {'day': DateFormat.E().format(weekday)[0], 'value': totalSum};
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    final weekTotalValue = _weekTotalValue;
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                groupedTransactions.map((tr) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label: tr['day'].toString(),
                      value: (tr['value'] as double),
                      percentage:
                          weekTotalValue == 0
                              ? 0
                              : (tr['value'] as double) / weekTotalValue,
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
