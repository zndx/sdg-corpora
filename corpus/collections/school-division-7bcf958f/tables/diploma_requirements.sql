CREATE TABLE diploma_requirements (
  id INTEGER NOT NULL,
  requirement_id VARCHAR(38),
  description VARCHAR(32),
  minimum_credits DECIMAL,
  is_verified BOOLEAN,
  regulation_code VARCHAR(44),
  diploma_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (diploma_id) REFERENCES diplomas (id)
);
