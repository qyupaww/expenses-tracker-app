import '../../../models/expense.dart';

abstract class ExpensesRepository {
  List<Expense> getAll();
  void add(Expense expense);
  void remove(Expense expense);
  void insert(int index, Expense expense);
}
