import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';

class EditExpensePage extends StatefulWidget {
  final String expenseId;

  EditExpensePage({required this.expenseId}); // Utilisez "required" pour indiquer que l'argument est obligatoire

  @override
  _EditExpensePageState createState() => _EditExpensePageState();
}

class _EditExpensePageState extends State<EditExpensePage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late double _amount;
  late String _categoryId;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   // Get the expense from Firestore.
  //   FirebaseFirestore.instance
  //       .collection('expenses')
  //       .doc(widget.expenseId)
  //       .get()
  //       .then((doc) {
  //     if (doc.exists) { // Vérifiez si le document existe avant d'accéder aux données
  //       setState(() {
  //         _title = doc.get('title') ?? ''; // Utilisez la null-safety pour accéder aux valeurs
  //         _amount = doc.get('amount') ?? 0.0; // Utilisez la null-safety pour accéder aux valeurs
  //         _categoryId = doc.get('category_id') ?? ''; // Utilisez la null-safety pour accéder aux valeurs
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editer une dépenses'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _title,
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
                  _title = value ?? '';
                },
              ),
              TextFormField(
                initialValue: _amount.toString(),
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Entrer un montant.';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _amount = double.tryParse(value ?? '') ?? 0.0;
                },
              ),
              DropdownButtonFormField<String>(
                value: _categoryId,
                decoration: InputDecoration(
                  labelText: 'Categorie',
                ),
                items: [
                  DropdownMenuItem(
                    value: 'Food',
                    child: Text('Nourriture'),
                  ),
                  DropdownMenuItem(
                    value: 'Transportation',
                    child: Text('Transpor'),
                  ),
                  DropdownMenuItem(
                    value: 'Housing',
                    child: Text('Maison'),
                  ),
                  DropdownMenuItem(
                    value: 'Entertainement',
                    child: Text('Loisir'),
                  ),
                  DropdownMenuItem(
                    value: 'Health',
                    child: Text('Santé'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _categoryId = value ?? '';
                  });
                },
              ),
              ElevatedButton(
                child: Text('Modification effectué'),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Save changes to Firestore.
                    await FirebaseFirestore.instance
                        .collection('expenses')
                        .doc(widget.expenseId)
                        .update({
                      'title': _title,
                      'amount': _amount,
                      'category_id': _categoryId,
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