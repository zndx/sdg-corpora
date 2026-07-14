CREATE TABLE policies_types (
  policy_id INTEGER NOT NULL,
  order_type_id INTEGER NOT NULL,
  PRIMARY KEY (policy_id, order_type_id),
  FOREIGN KEY (policy_id) REFERENCES policies (policy_id),
  FOREIGN KEY (order_type_id) REFERENCES order_types (id)
);
