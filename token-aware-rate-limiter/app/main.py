import os
import redis
from pydantic import BaseModel
from fastapi import FastAPI, HTTPException

REDIS_URL = os.getenv("REDIS_URL", "redis://localhost:6379")
redis_client = redis.Redis.from_url(REDIS_URL)

DATABASE_URL = os.getenv("DATABASE_URL")

app = FastAPI(
    title="Token Rate Limiter",
    description="A FastAPI service that enforces token-aware rate limits using Redis and PostgreSQL.",
    version="0.0.1",
)

class ChatRequest(BaseModel):
    user_id: str
    prompt: str

@app.get("/")
def main():
    return {"message": "Token rate limiter and chat simulator"}

@app.post("/v1/chat/completions")
def chat(request: ChatRequest):
    return {"message": "Chat request received"}


