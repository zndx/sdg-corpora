CREATE TABLE stakeholder_groups (
  id INTEGER NOT NULL,
  group_code VARCHAR(44),
  group_name VARCHAR(32),
  group_type VARCHAR(32),
  is_eligible_for_services BOOLEAN,
  service_function_id INTEGER,
  administrative_unit_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_function_id) REFERENCES service_functions (id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id)
);
