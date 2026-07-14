CREATE TABLE privacy_policies (
  id INTEGER NOT NULL,
  policy_i_d VARCHAR(32),
  policy_title VARCHAR(32),
  effective_date DATE,
  issuing_entity VARCHAR(32),
  jurisdiction VARCHAR(32),
  PRIMARY KEY (id)
);
