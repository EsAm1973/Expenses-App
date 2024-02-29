import 'package:flutter/material.dart';
import 'package:personal_expenses/charts/chart_bar.dart';
import 'package:personal_expenses/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<expenseBucket> get buckets {
    return [
      expenseBucket.fotCategory(Category.food, expenses),
      expenseBucket.fotCategory(Category.laisure, expenses),
      expenseBucket.fotCategory(Category.work, expenses),
      expenseBucket.fotCategory(Category.biils, expenses),
      expenseBucket.fotCategory(Category.travel, expenses),
    ];
  }

  double get maxTotlaExpense {
    double maxtotalexpense = 0;
    for (var element in buckets) {
      if (element.totalExpense > maxtotalexpense) {
        maxtotalexpense = element.totalExpense;
      }
    }
    return maxtotalexpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final element in buckets)
                  ChartBar(
                      fill: element.totalExpense == 0
                          ? 0
                          : element.totalExpense / maxTotlaExpense),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ...buckets
                  .map((e) => Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(categoryIcons[e.category],
                              color: isDarkMode
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.7)))))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
