CREATE TABLE protocols_members (
  protocol_id INTEGER NOT NULL,
  staff_member_staff_id INTEGER NOT NULL,
  PRIMARY KEY (protocol_id, staff_member_staff_id),
  FOREIGN KEY (protocol_id) REFERENCES safeguarding_protocols (protocol_id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id)
);
