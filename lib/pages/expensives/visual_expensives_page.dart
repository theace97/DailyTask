import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';

class ViewExpensePage extends StatefulWidget {
  final String expenseId;

  ViewExpensePage({required this.expenseId}); // Utilisez "required" pour indiquer que l'argument est obligatoire

  @override
  _ViewExpensePageState createState() => _ViewExpensePageState();
}

class _ViewExpensePageState extends State<ViewExpensePage> {
  late String _title; // Utilisez "late" pour indiquer que _title sera initialisé ultérieurement
  late double _amount; // Utilisez "late" pour indiquer que _amount sera initialisé ultérieurement
  late String _categoryId; // Utilisez "late" pour indiquer que _categoryId sera initialisé ultérieurement

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
        title: Text('Dépenses'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title: $_title'),
            Text('Amount: $_amount'),
            Text('Category: $_categoryId'),
          ],
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