CREATE TABLE board_policies (
  id INTEGER NOT NULL,
  policy_number VARCHAR(32),
  policy_title VARCHAR(32),
  effective_date DATE,
  policy_status VARCHAR(32),
  PRIMARY KEY (id)
);
