import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditCategoryPage extends StatefulWidget {
  final String categoryId;

  EditCategoryPage({required this.categoryId});

  @override
  _EditCategoryPageState createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  String _categoryName = ''; // Initialisez _categoryName à une chaîne vide

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Get the category name from Firestore.
  //   FirebaseFirestore.instance
  //       .collection('categories')
  //       .doc(widget.categoryId)
  //       .get()
  //       .then((doc) {
  //     if (doc.exists) {
  //       setState(() {
  //         _categoryName = doc.get('name') ?? '';
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editer une catégorie'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _categoryName,
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
              ElevatedButton(
                child: Text('Enregistrer catégorie'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Update the category in Firestore.
                    FirebaseFirestore.instance
                        .collection('categories')
                        .doc(widget.categoryId)
                        .update({
                      'name': _categoryName,
                    });

                    // Navigate back to the previous page.
                    Navigator.pop(context);
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