import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipd/models/user.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUser(BuildContext context, Users user) async {
    try {
      await usersCollection.add(user.toMap());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your account has been created!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.fixed,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong,Try again: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.fixed,
        ),
      );
    }
    Future<void> updateUser(Users user) async {
      await usersCollection.doc(user.id).update(user.toMap());
    }

    Future<void> deleteUser(String id) async {
      await usersCollection.doc(id).delete();
    }
  }
}
