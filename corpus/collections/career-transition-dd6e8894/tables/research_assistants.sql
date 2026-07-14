CREATE TABLE research_assistants (
  id INTEGER NOT NULL,
  assistant_id VARCHAR(44),
  full_name VARCHAR(36),
  degree VARCHAR(32),
  institution VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
