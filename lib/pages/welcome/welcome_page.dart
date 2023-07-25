import 'package:flutter/material.dart';
import 'package:daily_tasks/pages/expensives/create_expensives_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes dépenses'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bienvenue dans Mes dépenses !'),
            ElevatedButton(
              child: Text('Créer une nouvelle dépense'),
              onPressed: () {
                // Naviguer vers la page de création de dépense.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateExpensePage()),
                );
              },
            ),
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