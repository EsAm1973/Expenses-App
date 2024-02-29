import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/expense_item.dart';

import 'models/expense.dart';

class expensesList extends StatelessWidget {
  const expensesList({
    super.key,
    required this.listOfExpense,
    required this.removeExpense,
  });

  final List<Expense> listOfExpense;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfExpense.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(listOfExpense[index]),
          onDismissed: (direction) => removeExpense(listOfExpense[index]),
          child: expensesItem(expense: listOfExpense[index])),
    );
  }
}
