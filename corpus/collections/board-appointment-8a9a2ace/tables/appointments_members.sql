CREATE TABLE appointments_members (
  board_appointment_id INTEGER NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (board_appointment_id, board_member_id),
  FOREIGN KEY (board_appointment_id) REFERENCES board_appointments (board_appointment_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (board_member_id)
);
