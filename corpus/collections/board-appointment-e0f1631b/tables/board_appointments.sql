CREATE TABLE board_appointments (
  board_appointment_id INTEGER NOT NULL,
  appointment_id VARCHAR(35),
  appointment_date TIMESTAMP,
  role_title VARCHAR(32),
  term_start_date TIMESTAMP,
  term_end_date TIMESTAMP,
  appointment_status VARCHAR(32),
  person_id INTEGER,
  non_profit_organization_id INTEGER,
  succeeds_previous_appointee_person_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (board_appointment_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (non_profit_organization_id) REFERENCES non_profit_organizations (non_profit_organization_id),
  FOREIGN KEY (succeeds_previous_appointee_person_id) REFERENCES persons (person_id)
);
