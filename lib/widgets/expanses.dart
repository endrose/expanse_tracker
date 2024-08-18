import 'package:expanse_tracker/chart/chart.dart';
import 'package:expanse_tracker/widgets/expenses_list/expanses_list.dart';
import 'package:expanse_tracker/models/expanse.dart';
import 'package:expanse_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpansesState();
  }
}

class _ExpansesState extends State<Expanses> {
// create dummy
  final List<Expanse> _registerExpanses = [
    Expanse(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expanse(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    //
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expanse expense) {
    //
    setState(() {
      _registerExpanses.add(expense);
    });
  }

  void _removeExpense(Expanse expense) {
    final expenseIndex = _registerExpanses.indexOf(expense);
    setState(() {
      _registerExpanses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted.'),
      duration: const Duration(
        seconds: 3,
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registerExpanses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;

    print({
      "height": MediaQuery.of(context).size.height,
      "width": MediaQuery.of(context).size.width,
    });

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registerExpanses.isNotEmpty) {
      mainContent = ExpansesList(
        expanses: _registerExpanses,
        onRemoveExpense: (expense) {
          _removeExpense(expense);
        },
      );
    }

    return Scaffold(
        // Toolbar with the add button => Row()
        appBar: AppBar(
          title: const Text('Flutter Expense Tracker'),
          actions: [
            //
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: widthDevice < 600
            ? Column(
                children: [
                  // const Text('The Chart!'),
                  Chart(
                    expenses: _registerExpanses,
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  // const Text('The Chart!'),
                  Expanded(
                    child: Chart(
                      expenses: _registerExpanses,
                    ),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ));
  }
}
