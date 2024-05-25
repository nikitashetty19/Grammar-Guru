from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict, List
from algoOne import calculate_score_and_select_next_sentence, df


app = FastAPI()

# Data storage
received_data: List[Dict] = []

class SentenceData(BaseModel):
    totalAttempts: int
    timeTaken: int
    attemptsPerPunctuation: Dict

@app.post("/process-input/")
async def process_input(data: SentenceData):
    input_data = {
        'totalAttempts': data.totalAttempts,
        'timeTaken': data.timeTaken,
        'attemptsPerPunctuation': data.attemptsPerPunctuation
    }
    score, percent, next_level, next_sentence, _ = calculate_score_and_select_next_sentence(input_data, df)
    return {"next_sentence": next_sentence}