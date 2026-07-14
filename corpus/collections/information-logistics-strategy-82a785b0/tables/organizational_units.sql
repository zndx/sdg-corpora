CREATE TABLE organizational_units (
  organizational_unit_id INTEGER NOT NULL,
  unit_identifier VARCHAR(32),
  unit_name VARCHAR(32),
  department_type VARCHAR(32),
  implementation_role VARCHAR(32),
  information_logistics_strategy_id INTEGER,
  analytical_information_system_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (organizational_unit_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (id),
  FOREIGN KEY (analytical_information_system_id) REFERENCES analytical_information_systems (analytical_information_system_id)
);
