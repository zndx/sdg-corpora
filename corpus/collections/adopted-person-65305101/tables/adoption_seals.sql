CREATE TABLE adoption_seals (
  adoption_seal_id INTEGER NOT NULL,
  seal_id VARCHAR(32),
  seal_date TIMESTAMP,
  seal_type VARCHAR(32),
  valid_until TIMESTAMP,
  eternal_inheritance_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (adoption_seal_id),
  FOREIGN KEY (eternal_inheritance_id) REFERENCES eternal_inheritances (eternal_inheritance_id)
);
