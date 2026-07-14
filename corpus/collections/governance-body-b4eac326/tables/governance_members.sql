CREATE TABLE governance_members (
  id INTEGER NOT NULL,
  member_identifier VARCHAR(32),
  member_name VARCHAR(32),
  member_role VARCHAR(32),
  appointment_date DATE,
  is_external BOOLEAN,
  certification_status VARCHAR(32),
  governance_body_id INTEGER,
  meeting_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (governance_body_id) REFERENCES governance_bodies (id),
  FOREIGN KEY (meeting_id) REFERENCES meetings (id)
);
