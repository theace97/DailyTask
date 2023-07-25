import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';

class DeleteExpensePage extends StatelessWidget {
  final String expenseId;

  DeleteExpensePage({required this.expenseId}); // Utilisez "required" pour indiquer que l'argument est obligatoire

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supprimer dépense'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Supprimer dépense'),
          onPressed: () async {
            try {
              // Delete the expense from Firestore.
              await FirebaseFirestore.instance
                  .collection('expenses')
                  .doc(expenseId)
                  .delete();

              // Navigate back to the previous page.
              Navigator.pop(context);
            } catch (e) {
              // Handle any potential errors here.
              print('Erreur suppression dépense: $e');
            }
          },
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