CREATE TABLE analytical_information_systems (
  id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  system_name VARCHAR(32),
  deployment_date DATE,
  system_type VARCHAR(32),
  uptime_percentage DECIMAL,
  organizational_unit_id INTEGER,
  information_logistics_strategy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id),
  FOREIGN KEY (information_logistics_strategy_id) REFERENCES information_logistics_strategies (information_logistics_strategy_id)
);
