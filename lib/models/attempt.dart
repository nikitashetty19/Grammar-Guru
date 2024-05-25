class AttemptPunctuation {
  final String userId;
  final String attemptId;
  final String punctuationSymbol;
  final int attemptsCount;

  AttemptPunctuation({
    required this.userId,
    required this.attemptId,
    required this.punctuationSymbol,
    required this.attemptsCount,
  });

  factory AttemptPunctuation.fromMap(Map<String, dynamic> map) {
    return AttemptPunctuation(
      userId: map['userId'],
      attemptId: map['attemptId'],
      punctuationSymbol: map['punctuationSymbol'],
      attemptsCount: map['attemptsCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'attemptId': attemptId,
      'punctuationSymbol': punctuationSymbol,
      'attemptsCount': attemptsCount,
    };
  }
}
