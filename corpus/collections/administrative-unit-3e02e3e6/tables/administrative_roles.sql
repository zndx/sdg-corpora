CREATE TABLE administrative_roles (
  role_id VARCHAR(44) NOT NULL,
  role_title VARCHAR(32),
  role_level VARCHAR(32),
  appointment_date TIMESTAMP,
  is_chief_of_staff BOOLEAN,
  is_chief_resilience_officer BOOLEAN,
  person_id VARCHAR(32),
  administrative_unit_id INTEGER,
  oversees_administrative_unit_id INTEGER,
  PRIMARY KEY (role_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (administrative_unit_id) REFERENCES administrative_units (id),
  FOREIGN KEY (oversees_administrative_unit_id) REFERENCES administrative_units (id)
);
