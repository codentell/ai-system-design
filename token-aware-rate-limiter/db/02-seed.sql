-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

INSERT INTO users (id, email, tier, is_active, created_at) VALUES
  (gen_random_uuid(), 'ada@example.com', 'free', TRUE, NOW()),
  (gen_random_uuid(), 'claude@example.com', 'pro', TRUE, NOW()),
  (gen_random_uuid(), 'chat@example.com', 'enterprise', TRUE, NOW());

INSERT INTO api_key (id, user_id, api_key, created_at, revoked) VALUES
  (gen_random_uuid(), 
   (SELECT id FROM users WHERE email = 'ada@example.com'),
   'sk-' || encode(gen_random_bytes(24), 'base64'),
   NOW(), 
   FALSE),

  (gen_random_uuid(), 
   (SELECT id FROM users WHERE email = 'claude@example.com'),
   'sk-' || encode(gen_random_bytes(24), 'base64'),
   NOW(), 
   FALSE),

  (gen_random_uuid(), 
   (SELECT id FROM users WHERE email = 'chat@example.com'),
   'sk-' || encode(gen_random_bytes(24), 'base64'),
   NOW(), 
   TRUE);




INSERT INTO rules (id, tier, endpoint, method, time_unit, request_limit, token_limit, credit_limit) VALUES
  (gen_random_uuid(), 'free', '/v1/chat/completions', 'POST', 'minute', 20, 1000, 100),
  (gen_random_uuid(), 'pro', '/v1/chat/completions', 'POST', 'minute', 200, 10000, 1000),
  (gen_random_uuid(), 'enterprise', '/v1/chat/completions', 'POST', 'minute', 2000, 100000, 10000);