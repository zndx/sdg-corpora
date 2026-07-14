CREATE TABLE learning_management_systems (
  learning_management_system_id INTEGER NOT NULL,
  lms_id INTEGER,
  lms_name VARCHAR(32),
  supports_assignment_creation BOOLEAN,
  access_via_clever BOOLEAN,
  authentication_method_id INTEGER,
  PRIMARY KEY (learning_management_system_id),
  FOREIGN KEY (authentication_method_id) REFERENCES authentication_methods (id)
);
