import 'package:expanse_tracker/widgets/expenses_list/expanses_list.dart';
import 'package:expanse_tracker/models/expanse.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart!'),
          Expanded(
            child: ExpansesList(expanses: _registerExpanses),
          ),
        ],
      ),
    );
  }
}
