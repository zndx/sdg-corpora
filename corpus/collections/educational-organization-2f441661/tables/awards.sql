CREATE TABLE awards (
  award_id INTEGER NOT NULL,
  award_name VARCHAR(32),
  granting_authority VARCHAR(32),
  award_date DATE,
  monetary_value DECIMAL,
  government_body_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (award_id),
  FOREIGN KEY (government_body_id) REFERENCES government_bodies (id)
);
