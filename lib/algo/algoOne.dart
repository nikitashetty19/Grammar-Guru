import 'dart:math';

class Sentence {
  double difficultyLevel;
  String sentence;

  Sentence(this.difficultyLevel, this.sentence);
}

double calculateScore(String level, int numPunctuation, double timeTaken, int totalAttempts, double totalTime) {
  var baseScores = {'easy': 10, 'medium': 15, 'difficult': 20};
  var weightPerPunctuation = {'easy': 1.0, 'medium': 2.0, 'difficult': 3.0};

  if (!baseScores.containsKey(level)) {
    throw ArgumentError("Invalid level provided");
  }

  var baseScore = baseScores[level]!;
  var wtPerPunctuation = weightPerPunctuation[level]!;

  var timeBonus = 10 * (1 - timeTaken / totalTime);

  var score = (baseScore * wtPerPunctuation * numPunctuation) - totalAttempts + timeBonus;

  var idealScore = (baseScore * wtPerPunctuation * numPunctuation) - numPunctuation + 10;

  var percent = score * 100 / idealScore;

  return percent;
}

double selectNextSentenceLevel(double percent) {
  if (80 <= percent && percent <= 100) {
    return 3.0;
  } else if (50 <= percent && percent < 80) {
    return 2.0;
  } else {
    return 1.0;
  }
}

void nextSent(double le, List<Sentence> sentences) {
  var random = Random();

  var filteredSentences = sentences.where((s) => s.difficultyLevel == le).toList();
  if (filteredSentences.isNotEmpty) {
    var randomIndex = random.nextInt(filteredSentences.length);
    var randomSentence = filteredSentences[randomIndex].sentence;
    print("Random Sentence (Difficulty: $le):");
    print(randomSentence);
  } else {
    print("No sentences found for the specified difficulty level.");
  }
}

