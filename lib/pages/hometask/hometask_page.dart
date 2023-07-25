import 'package:flutter/material.dart';
import 'package:daily_tasks/pages/expensives/create_expensives_page.dart';
import 'package:daily_tasks/pages/expensives/delete_expensives_page.dart';
import 'package:daily_tasks/pages/expensives/edit_expensives_page.dart';
import 'package:daily_tasks/pages/expensives/visual_expensives_page.dart';
import 'package:daily_tasks/pages/category/category_page.dart';
import 'package:daily_tasks/pages/category/create_categories_page.dart';
import 'package:daily_tasks/pages/category/delete_category_page.dart';
import 'package:daily_tasks/pages/category/edit_category_page.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/profile/profile_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';

class HomeTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes dépenses'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Créer une nouvelle dépense'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateExpensePage()),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Modifier une dépense'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditExpensePage(expenseId: "1")),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Supprimer une dépense'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DeleteExpensePage(expenseId: "1")),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Visualiser les dépenses'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewExpensePage(expenseId: "1")),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 16), // Espace entre les colonnes (16 est une valeur arbitraire, vous pouvez ajuster selon vos besoins)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Créer une catégorie'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateCategoryPage()),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Modifier une catégorie'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditCategoryPage(categoryId: "1")),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Supprimer une catégorie'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DeleteCategoryPage(categoryId: "1")),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Visualiser les catégories'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExpenseCategoriesPage()),
                      );
                    },
                  ),
                ],
              ),
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