import os
import redis
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

REDIS_URL = os.getenv("REDIS_URL", "redis://localhost:6379")
redis_client = redis.Redis.from_url(REDIS_URL)

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

@app.post("/chat")
def chat(request: ChatRequest):
    return {"message": "Chat request received"}


