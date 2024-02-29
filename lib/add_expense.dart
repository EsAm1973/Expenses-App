import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/expense.dart';

class newExpense extends StatefulWidget {
  const newExpense({super.key, required this.newExpenseItem});

  final Function(Expense expense) newExpenseItem;

  @override
  State<newExpense> createState() => _newExpenseState();
}

class _newExpenseState extends State<newExpense> {
  final addTitle = TextEditingController();
  final addPrice = TextEditingController();
  final formatter = DateFormat.yMd();
  DateTime? selectedDate;
  Category selectedCategory = Category.work;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addTitle.dispose();
    addPrice.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: addTitle,
              maxLength: 50,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: addPrice,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Price',
                suffixText: '\$',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(selectedDate == null
                    ? 'Please Select Date'
                    : formatter.format(selectedDate!)),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () async {
                    final now = DateTime.now();
                    final firstDate = DateTime(now.year - 10, now.month, now.day);
    
                    final DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: firstDate,
                        lastDate: now);
                    setState(() {
                      selectedDate = pickDate;
                    });
                  },
                  icon: const Icon(Icons.calendar_month),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              const Text('Select Category'),
              const SizedBox(
                width: 8,
              ),
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (newVal) {
                  if (newVal == null) return;
                  setState(() {
                    selectedCategory = newVal;
                  });
                },
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final double? enteredPrice = double.tryParse(addPrice.text);
                    final priceIsInValid =
                        enteredPrice == null || enteredPrice <= 0;
                    if (addTitle.text.trim().isEmpty ||
                        priceIsInValid ||
                        selectedDate == null) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text(
                            'InValid Data',
                          ),
                          content: const Text(
                            'Please make sure enter valid title and valid price and select date',
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text('OK')),
                          ],
                        ),
                      );
                    } else {
                      widget.newExpenseItem(
                        Expense(
                          title: addTitle.text,
                          price: enteredPrice,
                          date: selectedDate!,
                          category: selectedCategory,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save Expense'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
