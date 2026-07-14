CREATE TABLE service_functions (
  id INTEGER NOT NULL,
  function_id VARCHAR(38),
  function_name VARCHAR(32),
  function_category VARCHAR(32),
  is_core_function BOOLEAN,
  service_level VARCHAR(32),
  administrative_unit_id INTEGER,
  stakeholder_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id),
  FOREIGN KEY (stakeholder_group_id) REFERENCES stakeholder_groups (id)
);
