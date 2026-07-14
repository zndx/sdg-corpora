CREATE TABLE order_types (
  id INTEGER NOT NULL,
  order_type_id VARCHAR(44),
  name VARCHAR(32),
  minimum_quantity INTEGER,
  requires_advance_notice BOOLEAN,
  policy_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (policy_id) REFERENCES policies (policy_id)
);
