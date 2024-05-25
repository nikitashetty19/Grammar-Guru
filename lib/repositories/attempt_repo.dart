import 'package:cloud_firestore/cloud_firestore.dart';

class AttemptPunctuationRepository {
  final CollectionReference _attemptPunctuationCollection =
      FirebaseFirestore.instance.collection('AttemptPunctuation');

  // Function to add AttemptPunctuation data to Firestore
  Future<void> addAttemptPunctuation({
    required String userId,
    required int attemptId,
    required String punctuationSymbol,
    required int attemptsCount,
  }) async {
    String documentId = '${userId}_attempt_$attemptId';

    // Create the document with the specified document ID
    await _attemptPunctuationCollection.doc(documentId).set({
      'userId': userId,
      'attemptId': attemptId,
      'punctuationSymbol': punctuationSymbol,
      'attemptsCount': attemptsCount,
    });
  }
}
