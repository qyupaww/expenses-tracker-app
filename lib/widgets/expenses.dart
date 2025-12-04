import 'package:expenses_tracker_app/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 109000,
        date: DateTime.now(),
        category: Category.others),
    Expense(
        title: 'Nasi Padang',
        amount: 10000,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpenses,
      ),
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverLay,
            icon: const Icon(
              Icons.add,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              "The Chart",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
