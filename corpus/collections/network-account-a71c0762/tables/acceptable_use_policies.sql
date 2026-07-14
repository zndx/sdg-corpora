CREATE TABLE acceptable_use_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  version_number VARCHAR(32),
  effective_date DATE,
  is_legally_binding BOOLEAN,
  prohibits_commercial_use BOOLEAN,
  requires_ethical_behavior BOOLEAN,
  network_account_id INTEGER,
  student_id INTEGER,
  network_administrator_admin_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (network_account_id) REFERENCES network_accounts (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (network_administrator_admin_id) REFERENCES network_administrators (admin_id)
);
