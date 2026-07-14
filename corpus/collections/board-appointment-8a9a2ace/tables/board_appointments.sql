CREATE TABLE board_appointments (
  board_appointment_id INTEGER NOT NULL,
  appointment_id VARCHAR(35),
  appointment_date TIMESTAMP,
  term_start_date DATE,
  term_end_date DATE,
  term_length_years INTEGER,
  confirmation_status VARCHAR(32),
  statutory_authority VARCHAR(32),
  board_of_trustees_id INTEGER,
  county_executive_id INTEGER,
  PRIMARY KEY (board_appointment_id),
  FOREIGN KEY (board_of_trustees_id) REFERENCES board_of_trusteeses (id),
  FOREIGN KEY (county_executive_id) REFERENCES county_executives (id)
);
