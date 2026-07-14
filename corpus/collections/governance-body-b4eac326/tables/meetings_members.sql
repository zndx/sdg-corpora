CREATE TABLE meetings_members (
  meeting_id INTEGER NOT NULL,
  governance_member_id INTEGER NOT NULL,
  PRIMARY KEY (meeting_id, governance_member_id),
  FOREIGN KEY (meeting_id) REFERENCES meetings (id),
  FOREIGN KEY (governance_member_id) REFERENCES governance_members (id)
);
