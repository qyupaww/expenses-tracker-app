import '../../../models/expense.dart';
import '../domain/expenses_repository.dart';

class InMemoryExpensesRepository implements ExpensesRepository {
  InMemoryExpensesRepository({List<Expense>? seed})
      : _items = List<Expense>.from(seed ?? const []);

  final List<Expense> _items;

  @override
  List<Expense> getAll() => List<Expense>.unmodifiable(_items);

  @override
  void add(Expense expense) => _items.add(expense);

  @override
  void remove(Expense expense) => _items.remove(expense);

  @override
  void insert(int index, Expense expense) => _items.insert(index, expense);
}
