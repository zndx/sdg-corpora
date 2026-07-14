CREATE TABLE traffic_rules (
  rule_code VARCHAR(44) NOT NULL,
  rule_description VARCHAR(32),
  enforcement_level VARCHAR(32),
  effective_date DATE,
  repeal_date DATE,
  municipal_code_id INTEGER,
  vehicle_class_id INTEGER,
  PRIMARY KEY (rule_code),
  FOREIGN KEY (municipal_code_id) REFERENCES municipal_codes (id),
  FOREIGN KEY (vehicle_class_id) REFERENCES vehicle_classes (id)
);
