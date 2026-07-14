CREATE TABLE bodies_members (
  governance_body_id INTEGER NOT NULL,
  governance_member_id INTEGER NOT NULL,
  PRIMARY KEY (governance_body_id, governance_member_id),
  FOREIGN KEY (governance_body_id) REFERENCES governance_bodies (id),
  FOREIGN KEY (governance_member_id) REFERENCES governance_members (id)
);
