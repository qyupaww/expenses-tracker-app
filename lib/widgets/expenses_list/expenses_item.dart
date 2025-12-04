import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../core/formatters/currency_formatter.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    required this.expense,
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  formatRupiah(expense.amount),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
