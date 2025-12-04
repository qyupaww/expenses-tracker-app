import 'package:expenses_tracker_app/widgets/chart/chart.dart';
import 'package:expenses_tracker_app/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../features/expenses/data/in_memory_expenses_repository.dart';
import '../features/expenses/domain/expenses_repository.dart';
import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late final ExpensesRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = InMemoryExpensesRepository(seed: [
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
    ]);
  }

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
    _repository.add(expense);
    setState(() {});
  }

  void _removeExpense(Expense expense) {
    final current = _repository.getAll();
    final expenseIndex = current.indexOf(expense);
    _repository.remove(expense);
    setState(() {});
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            _repository.insert(expenseIndex, expense);
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found'),
    );

    final items = _repository.getAll();
    if (items.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: items,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
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
            child: Chart(expenses: _repository.getAll()),
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
