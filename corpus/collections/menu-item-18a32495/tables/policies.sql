CREATE TABLE policies (
  policy_id INTEGER NOT NULL,
  description VARCHAR(32),
  effective_date TIMESTAMP,
  is_active BOOLEAN,
  PRIMARY KEY (policy_id)
);
