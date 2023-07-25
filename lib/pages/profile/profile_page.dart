import 'package:flutter/material.dart';
import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/hometask/hometask_page.dart';
import 'package:daily_tasks/shared/widgets/bottom_navigation_barre_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/profile_picture.png'), // Remplacez par votre image de profil
            ),
            SizedBox(height: 16.0),
            Text(
              'John Doe', // Remplacez par le nom d'utilisateur
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'john.doe@example.com', // Remplacez par l'adresse e-mail de l'utilisateur
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Mettez ici l'action que vous souhaitez effectuer lorsque le bouton est cliqué, par exemple pour modifier les informations du profil.
              },
              child: Text('Modifier le profil'),
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