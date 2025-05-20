# Setup

```bash
docker build -t token-aware-rate-limiter .
docker run -p 8000:8080 token-aware-rate-limiter
```

### Build container
```bash
docker compose up --build
```

### Connect to Redis 
```bash
docker exec -it redis redis-cli
```

### Connect to the PostgreSQL DB
```bash
docker compose down -v
docker exec -it postgres-db psql -U postgres -d token_aware_rate_limiter_db     
```

```bash
\c token_aware_rate_limiter_db
\dt 

\d users
\d api_key
\d rules

```





