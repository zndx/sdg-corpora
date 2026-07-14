CREATE TABLE board_members (
  board_member_id INTEGER NOT NULL,
  member_id INTEGER,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  current_role VARCHAR(32),
  is_reappointment BOOLEAN,
  board_of_trustees_id INTEGER,
  board_appointment_id INTEGER,
  county_jurisdiction_id INTEGER,
  PRIMARY KEY (board_member_id),
  FOREIGN KEY (board_of_trustees_id) REFERENCES board_of_trusteeses (id),
  FOREIGN KEY (board_appointment_id) REFERENCES board_appointments (board_appointment_id),
  FOREIGN KEY (county_jurisdiction_id) REFERENCES county_jurisdictions (county_jurisdiction_id)
);
