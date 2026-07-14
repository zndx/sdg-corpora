CREATE TABLE animal_control_officers (
  animal_control_officer_id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  certification_level VARCHAR(43),
  license_status VARCHAR(32),
  on_call_status VARCHAR(32),
  safety_coordinator_role BOOLEAN,
  vector_control_activity_id INTEGER,
  animal_emergency_id INTEGER,
  PRIMARY KEY (animal_control_officer_id),
  FOREIGN KEY (vector_control_activity_id) REFERENCES vector_control_activities (id),
  FOREIGN KEY (animal_emergency_id) REFERENCES animal_emergencies (id)
);
