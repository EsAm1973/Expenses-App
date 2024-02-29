import 'package:flutter/material.dart';
import 'package:personal_expenses/models/expense.dart';



class expensesItem extends StatelessWidget {
  const expensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text(
                expense.title,
                style:
                    Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('\$${expense.price.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(expense.formatDate),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
