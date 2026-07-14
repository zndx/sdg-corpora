CREATE TABLE limiting_condition_of_operations (
  limiting_condition_of_operation_id INTEGER NOT NULL,
  lco_identifier VARCHAR(32),
  lco_description VARCHAR(32),
  is_necessary BOOLEAN,
  is_required BOOLEAN,
  compliance_deadline TIMESTAMP,
  support_system_id INTEGER,
  PRIMARY KEY (limiting_condition_of_operation_id),
  FOREIGN KEY (support_system_id) REFERENCES support_systems (support_system_id)
);
