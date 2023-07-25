import 'package:flutter/material.dart';

class ExpenseOverviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> _expenses = [
    {
      'title': 'Housing',
      'amount': 1000,
    },
    {
      'title': 'Food',
      'amount': 500,
    },
    {
      'title': 'Transportation',
      'amount': 200,
    },
    {
      'title': 'Entertainment',
      'amount': 100,
    },
    {
      'title': 'Other',
      'amount': 200,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Overview'),
      ),
      body: ListView.separated(
        itemCount: _expenses.length,
        separatorBuilder: (context, index) => Divider(), // Ajoute un séparateur entre chaque élément de la liste
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_expenses[index]['title']),
              subtitle: Text('\$' + _expenses[index]['amount'].toString()),
            ),
          );
        },
      ),
    );
  }
}