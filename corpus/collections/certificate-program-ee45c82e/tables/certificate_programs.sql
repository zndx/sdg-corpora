CREATE TABLE certificate_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  delivery_mode VARCHAR(32),
  effective_date DATE,
  minimum_g_p_a DECIMAL,
  word_limit INTEGER,
  credential_id VARCHAR(35),
  PRIMARY KEY (id),
  FOREIGN KEY (credential_id) REFERENCES credentials (credential_id)
);
