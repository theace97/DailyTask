// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:daily_tasks/pages/welcome/welcome_page.dart';
//
// void main() async {
//   // Initialisez Firebase avant de démarrer l'application
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     runApp(MyApp());
//   } catch (error) {
//     print("Error during Firebase Initialization: $error");
//   }
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       home: HomePage(),
//     );
//   }
// }




import 'package:flutter/material.dart';
// import 'package:daily_tasks/pages/welcome/welcome_page.dart';
import 'package:daily_tasks/pages/welcome/welcome_auth_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      // home: HomePage(),
      home: WelcomePage(),
    );
  }
}


