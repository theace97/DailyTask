import 'package:cloud_firestore/cloud_firestore.dart';

class ExpensesRepository {
  final FirebaseFirestore _firestore;

  ExpensesRepository(this._firestore);

  Future<void> createExpense(String title, double amount, String categoryId) async {
    final doc = _firestore.collection('expenses').doc();
    await doc.set({
      'title': title,
      'amount': amount,
      'categoryId': categoryId,
    });
  }

  Future<void> updateExpense(String expenseId, String title, double amount, String categoryId) async {
    final doc = _firestore.collection('expenses').doc(expenseId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      await doc.update({
        'title': title,
        'amount': amount,
        'categoryId': categoryId,
      });
    } else {
      throw Exception('Expense not found'); // Gérez l'erreur si le document n'existe pas
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    final doc = _firestore.collection('expenses').doc(expenseId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      await doc.delete();
    } else {
      throw Exception('Expense not found'); // Gérez l'erreur si le document n'existe pas
    }
  }

  Future<List<Expense>> getAllExpenses() async {
    final query = await _firestore.collection('expenses').get();
    final expenses = query.docs.map((doc) {
      return Expense(
        id: doc.id,
        title: doc.data()['title'],
        amount: doc.data()['amount'],
        categoryId: doc.data()['categoryId'],
      );
    }).toList();
    return expenses;
  }

  Future<List<Expense>> getExpensesByCategory(String categoryId) async {
    final query = await _firestore
        .collection('expenses')
        .where('categoryId', isEqualTo: categoryId)
        .get();
    final expenses = query.docs.map((doc) {
      return Expense(
        id: doc.id,
        title: doc.data()['title'],
        amount: doc.data()['amount'],
        categoryId: doc.data()['categoryId'],
      );
    }).toList();
    return expenses;
  }
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final String categoryId;

  Expense({required this.id, required this.title, required this.amount, required this.categoryId});
}