CREATE TABLE members_protocols (
  staff_member_staff_id INTEGER NOT NULL,
  protocol_id INTEGER NOT NULL,
  PRIMARY KEY (staff_member_staff_id, protocol_id),
  FOREIGN KEY (staff_member_staff_id) REFERENCES staff_members (staff_id),
  FOREIGN KEY (protocol_id) REFERENCES safeguarding_protocols (protocol_id)
);
