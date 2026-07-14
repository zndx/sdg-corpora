CREATE TABLE executive_appointments (
  executive_appointment_id INTEGER NOT NULL,
  appointment_date DATE,
  start_date DATE,
  end_date DATE,
  appointment_status VARCHAR(32),
  appointment_identifier VARCHAR(32),
  executive_person_id INTEGER,
  corporate_entity_id INTEGER,
  executive_role_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (executive_appointment_id),
  FOREIGN KEY (executive_person_id) REFERENCES executive_persons (id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (corporate_entity_id),
  FOREIGN KEY (executive_role_id) REFERENCES executive_roles (id)
);
