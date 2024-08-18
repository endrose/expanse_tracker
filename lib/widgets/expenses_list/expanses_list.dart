import 'package:expanse_tracker/models/expanse.dart';
import 'package:expanse_tracker/widgets/expenses_list/expanse_item.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
    super.key,
    required this.expanses,
    required this.onRemoveExpense,
  });

  final void Function(Expanse expense) onRemoveExpense;
  final List<Expanse> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expanses[index]);
        },
        key: ValueKey(expanses[index]),
        child: Expanded(
          child: ExpanseItem(
            expanses[index],
          ),
        ),
      ),
    );
  }
}
