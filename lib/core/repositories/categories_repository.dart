import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesRepository {
  final FirebaseFirestore _firestore;

  CategoriesRepository(this._firestore);

  Future<void> createCategory(String categoryName) async {
    final doc = _firestore.collection('categories').doc();
    await doc.set({
      'name': categoryName,
    });
  }

  Future<void> updateCategory(String categoryId, String categoryName) async {
    final doc = _firestore.collection('categories').doc(categoryId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      await doc.update({
        'name': categoryName,
      });
    } else {
      throw Exception('Category not found'); // Gérez l'erreur si le document n'existe pas
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    final doc = _firestore.collection('categories').doc(categoryId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      await doc.delete();
    } else {
      throw Exception('Category not found'); // Gérez l'erreur si le document n'existe pas
    }
  }

  Future<List<Category>> getAllCategories() async {
    final query = await _firestore.collection('categories').get();
    final categories = query.docs.map((doc) {
      return Category(
        id: doc.id,
        name: doc.data()['name'],
      );
    }).toList();
    return categories;
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}
