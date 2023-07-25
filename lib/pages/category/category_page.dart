import 'package:flutter/material.dart';

class ExpenseCategoriesPage extends StatefulWidget {
  @override
  _ExpenseCategoriesPageState createState() => _ExpenseCategoriesPageState();
}

class _ExpenseCategoriesPageState extends State<ExpenseCategoriesPage> {
  final _categories = [
    'Maison',
    'Nourriture',
    'Transport',
    'Loisir',
    'Santé',
  ];

  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catégories'),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_categories[index]),
            selected: index == _selectedCategoryIndex,
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}