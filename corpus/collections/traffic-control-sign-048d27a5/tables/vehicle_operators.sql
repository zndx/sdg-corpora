CREATE TABLE vehicle_operators (
  operator_id VARCHAR(44) NOT NULL,
  license_number VARCHAR(32),
  license_status VARCHAR(32),
  last_violation_date DATE,
  vehicle_class_id INTEGER,
  rule_code VARCHAR(44),
  PRIMARY KEY (operator_id),
  FOREIGN KEY (vehicle_class_id) REFERENCES vehicle_classes (id),
  FOREIGN KEY (rule_code) REFERENCES traffic_rules (rule_code)
);
