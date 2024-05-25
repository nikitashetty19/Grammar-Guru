import pandas as pd
import random
df=pd.read_csv("C:/Users/User/Downloads/IPD dataset_ff - IPD dataset_ff.csv")
df['DIFFICULTY LEVEL']=df['DIFFICULTY LEVEL'].replace({'easy':1,'medium':2,'difficult':3})
def calculate_score_and_select_next_sentence(input_data, df, prev_indices=[]):
    # Extract necessary values from the input dictionary
    total_attempts = input_data['totalAttempts']
    time_taken = input_data['timeTaken']
    attempts_per_punctuation = input_data['attemptsPerPunctuation']
    
    # Assuming 'level' needs to be determined or provided differently
    # For this example, let's calculate the level based on total attempts, just as an example
    # This should be adjusted based on your actual logic for determining the level
    level = 'easy' if total_attempts <= 5 else 'medium' if total_attempts <= 10 else 'difficult'
    
    # Count the number of punctuations attempted
    num_punctuation = sum(attempts_per_punctuation.values())
    
    # Assuming total_time is constant or needs to be defined elsewhere
    total_time = 60  # Adjust as necessary

    # Existing logic for calculating score and selecting the next sentence
    base_scores = {'easy': 10, 'medium': 15, 'difficult': 20}
    weight_per_punctuation = {'easy': 1.0, 'medium': 2.0, 'difficult': 3.0}
    
    if level not in base_scores:
        raise ValueError("Invalid level provided")
    
    base_score = base_scores[level]
    wt_per_punctuation = weight_per_punctuation[level]
    
    time_bonus = 10 * (1 - time_taken / total_time)
    
    score = (base_score * wt_per_punctuation * num_punctuation) - total_attempts + time_bonus
    
    ideal_score = (base_score * wt_per_punctuation * num_punctuation) - num_punctuation + 10
    
    percent = score * 100 / ideal_score
    
    if 80 <= percent <= 100:
        next_level = 3.0
    elif 50 <= percent < 80:
        next_level = 2.0
    else:
        next_level = 1.0
    
    next_level_sentences = df[df['DIFFICULTY LEVEL'] == next_level]
    
    if not next_level_sentences.empty:
        available_indices = [idx for idx in next_level_sentences.index if idx not in prev_indices]
        if available_indices:
            random_index = random.choice(available_indices)
            random_sentence = next_level_sentences.loc[random_index, 'SENTENCE']
            prev_indices.append(random_index)
            return score, percent, next_level, random_sentence, prev_indices
        else:
            return score, percent, next_level, "All available sentences at the next level have been used.", prev_indices
    else:
        return score, percent, next_level, "No sentences found at the next level.", prev_indices

# Example usage
input_data = {'totalAttempts': 0, 'timeTaken': 1, 'attemptsPerPunctuation': {',': 0, '.': 0, '!': 0, '?': 0, ';': 0, ':': 0}}
score, percent, next_level, next_sentence, prev_indices = calculate_score_and_select_next_sentence(input_data, df)
print(f"Score: {score}")
print(f"Percent: {percent}%")
print(f"Next Level: {next_level}")
print(f"Next Sentence: {next_sentence}")