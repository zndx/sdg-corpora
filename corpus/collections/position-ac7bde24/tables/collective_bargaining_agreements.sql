CREATE TABLE collective_bargaining_agreements (
  id INTEGER NOT NULL,
  agreement_id VARCHAR(44),
  effective_date DATE,
  expiration_date DATE,
  union_name VARCHAR(32),
  status VARCHAR(32),
  employee_id INTEGER,
  position_id INTEGER,
  administered_by_employee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (administered_by_employee_id) REFERENCES employees (id)
);
