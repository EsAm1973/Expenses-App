import 'package:flutter/material.dart';
import 'package:personal_expenses/add_expense.dart';

import 'package:personal_expenses/models/expense.dart';

import 'charts/chart.dart';
import 'expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> listOfExpense = [];

  void addExpense(Expense expense) {
    setState(() {
      listOfExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      listOfExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => newExpense(
                    newExpenseItem: addExpense,
                  ),
                );
              },
              icon: const Icon(Icons.add)),
        ],
        title: const Text('Expenses App'),
        centerTitle: true,
      ),
      body: Center(
        child: width < 600
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chart(expenses: listOfExpense),
                  Expanded(
                    child: expensesList(
                        removeExpense: removeExpense,
                        listOfExpense: listOfExpense),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Chart(expenses: listOfExpense)),
                  Expanded(
                    child: expensesList(
                        removeExpense: removeExpense,
                        listOfExpense: listOfExpense),
                  )
                ],
              ),
      ),
    );
  }
}
