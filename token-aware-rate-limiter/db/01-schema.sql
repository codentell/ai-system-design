CREATE TABLE users (
    id UUID PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    tier VARCHAR NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE api_key (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES users(id),
    api_key VARCHAR UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    revoked BOOLEAN DEFAULT FALSE
);

CREATE TABLE rules (
    id UUID PRIMARY KEY,
    tier TEXT NOT NULL,
    endpoint VARCHAR NOT NULL,
    method VARCHAR NOT NULL,
    time_unit VARCHAR CHECK (time_unit IN ('second', 'minute', 'hour', 'day')) NOT NULL,
    request_limit INTEGER NOT NULL,
    token_limit INTEGER NOT NULL,
    credit_limit INTEGER NOT NULL,
    UNIQUE (tier, endpoint, method)
);