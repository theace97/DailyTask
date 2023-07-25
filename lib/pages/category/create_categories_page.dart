import 'package:flutter/material.dart';

class CreateCategoryPage extends StatefulWidget {
  @override
  _CreateCategoryPageState createState() => _CreateCategoryPageState();
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  String _categoryName = ''; // Initialisez _categoryName à une chaîne vide

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une catégorie'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom de la catégorie',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer une catégorie.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _categoryName = value ?? '';
                },
              ),
              ElevatedButton( // Utilisez ElevatedButton à la place de RaisedButton
                child: Text('Catégorie créé'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the category.
                    _formKey.currentState!.save();

                    // Navigate back to the previous page.
                    Navigator.pop(context, _categoryName);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}