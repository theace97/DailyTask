import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteCategoryPage extends StatelessWidget {
  final String categoryId;

  DeleteCategoryPage({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Category'),
      ),
      body: Center(
        child: ElevatedButton( // Utilisez ElevatedButton à la place de RaisedButton
          child: Text('Delete Category'),
          onPressed: () async { // Utilisez le mot-clé async pour gérer la suppression de manière asynchrone
            try {
              // Delete the category from Firestore.
              await FirebaseFirestore.instance
                  .collection('categories')
                  .doc(categoryId)
                  .delete();

              // Navigate back to the previous page.
              Navigator.pop(context);
            } catch (e) {
              // Handle any potential errors here.
              print('Error deleting category: $e');
            }
          },
        ),
      ),
    );
  }
}