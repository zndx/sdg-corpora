CREATE TABLE committees_members (
  governance_committee_id INTEGER NOT NULL,
  governance_member_id INTEGER NOT NULL,
  PRIMARY KEY (governance_committee_id, governance_member_id),
  FOREIGN KEY (governance_committee_id) REFERENCES governance_committees (id),
  FOREIGN KEY (governance_member_id) REFERENCES governance_members (id)
);
