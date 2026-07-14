CREATE TABLE executives_appointments (
  county_executive_id INTEGER NOT NULL,
  board_appointment_id INTEGER NOT NULL,
  PRIMARY KEY (county_executive_id, board_appointment_id),
  FOREIGN KEY (county_executive_id) REFERENCES county_executives (id),
  FOREIGN KEY (board_appointment_id) REFERENCES board_appointments (board_appointment_id)
);
