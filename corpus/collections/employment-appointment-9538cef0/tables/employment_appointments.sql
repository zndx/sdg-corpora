CREATE TABLE employment_appointments (
  id INTEGER NOT NULL,
  appointment_id VARCHAR(35),
  position_title VARCHAR(32),
  appointee_name VARCHAR(32),
  term_start_date DATE,
  term_end_date DATE,
  nomination_date TIMESTAMP,
  approval_status VARCHAR(32),
  reappointment_count INTEGER,
  municipal_official_id INTEGER,
  municipal_council_id INTEGER,
  municipal_employee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_official_id) REFERENCES municipal_officials (id),
  FOREIGN KEY (municipal_council_id) REFERENCES municipal_councils (municipal_council_id),
  FOREIGN KEY (municipal_employee_id) REFERENCES municipal_employees (id)
);
