CREATE TABLE executive_persons (
  id INTEGER NOT NULL,
  person_identifier VARCHAR(34),
  full_name VARCHAR(36),
  professional_title VARCHAR(32),
  certification_status VARCHAR(32),
  certification_body VARCHAR(32),
  executive_appointment_id INTEGER,
  corporate_entity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_appointment_id) REFERENCES executive_appointments (executive_appointment_id),
  FOREIGN KEY (corporate_entity_id) REFERENCES corporate_entities (corporate_entity_id)
);
