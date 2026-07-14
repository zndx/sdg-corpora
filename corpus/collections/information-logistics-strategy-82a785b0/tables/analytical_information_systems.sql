CREATE TABLE analytical_information_systems (
  analytical_information_system_id INTEGER NOT NULL,
  system_identifier VARCHAR(32),
  system_name VARCHAR(32),
  system_type VARCHAR(32),
  deployment_date DATE,
  coverage_scope VARCHAR(32),
  organizational_unit_id INTEGER,
  extends_analytical_information_system_id INTEGER,
  PRIMARY KEY (analytical_information_system_id),
  FOREIGN KEY (organizational_unit_id) REFERENCES organizational_units (organizational_unit_id),
  FOREIGN KEY (extends_analytical_information_system_id) REFERENCES analytical_information_systems (analytical_information_system_id)
);
