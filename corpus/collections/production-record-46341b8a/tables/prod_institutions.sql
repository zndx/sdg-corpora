CREATE TABLE prod_institutions (
  institution_id INTEGER NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  headquarters VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (institution_id)
);
