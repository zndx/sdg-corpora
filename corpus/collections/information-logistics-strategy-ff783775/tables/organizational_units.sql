CREATE TABLE organizational_units (
  organizational_unit_id INTEGER NOT NULL,
  unit_identifier VARCHAR(32),
  unit_name VARCHAR(32),
  department_code VARCHAR(32),
  head_count INTEGER,
  budget_allocation VARCHAR(32),
  information_logistics_strategy_id INTEGER,
  reports_to_organizational_unit_id INTEGER,
  PRIMARY KEY (organizational_unit_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id),
  FOREIGN KEY (reports_to_organizational_unit_id) REFERENCES organizational_units (organizational_unit_id)
);
