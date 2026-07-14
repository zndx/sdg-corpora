CREATE TABLE executive_roles (
  id INTEGER NOT NULL,
  role_title VARCHAR(32),
  role_level VARCHAR(32),
  department VARCHAR(32),
  role_status VARCHAR(32),
  executive_appointment_id INTEGER,
  corporate_entity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_appointment_id) REFERENCES executive_appointments (executive_appointment_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (corporate_entity_id)
);
