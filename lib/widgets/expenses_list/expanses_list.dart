import 'package:expanse_tracker/models/expanse.dart';
import 'package:expanse_tracker/widgets/expenses_list/expanse_item.dart';
import 'package:flutter/material.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({
    super.key,
    required this.expanses,
  });

  final List<Expanse> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) => Expanded(
        child: ExpanseItem(expanses[index]),
      ),
    );
  }
}
