CREATE TABLE organizational_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_title VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  scope VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);
