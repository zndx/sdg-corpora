CREATE TABLE vehicle_classes (
  id INTEGER NOT NULL,
  vehicle_class_code VARCHAR(44),
  class_description VARCHAR(32),
  requires_muffler BOOLEAN,
  requires_brakes BOOLEAN,
  requires_lights BOOLEAN,
  rule_code VARCHAR(44),
  operator_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (rule_code) REFERENCES traffic_rules (rule_code),
  FOREIGN KEY (operator_id) REFERENCES vehicle_operators (operator_id)
);
