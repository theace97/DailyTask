import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';

class CreateExpensePage extends StatefulWidget {
  @override
  _CreateExpensePageState createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  double? _amount;
  String? _categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de dépense'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Entrer un titre.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Montant',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Entrer un montant.';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _amount = double.tryParse(value ?? '');
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Categorie',
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Food',
                    child: Text('Alimentation'),
                  ),
                  DropdownMenuItem(
                    value: 'Transportation',
                    child: Text('Transport'),
                  ),
                  DropdownMenuItem(
                    value: 'Housing',
                    child: Text('Maison'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _categoryId = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text('Créer une dépense'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    FirebaseFirestore.instance.collection('expenses').add({
                      'title': _title,
                      'amount': _amount,
                      'category_id': _categoryId,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar( // Utilisez MyBottomNavigationBar ici
        currentIndex: 0, // Indiquez l'index actuel de la page (0, 1 ou 2)
        onTap: (index) {
          // Gérez la navigation ici en fonction de l'index (0, 1 ou 2)
          if (index == 0) {
            // Rediriger vers la page WelcomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            // Rediriger vers la page HomeTaskPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeTaskPage()),
            );
          } else if (index == 2) {
            // Rediriger vers la page ProfilePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}